<?php

namespace App\Http\Controllers;

use App\Role;
use App\User;
use App\Films;
use App\UserFilms;
use Mail; 
use Illuminate\Mail\Mailer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Validator;
use App\Mail\FusionMail;

class UsersController extends Controller
{
    /**
     * Show a list of users
     * @return \Illuminate\View\View
     */
    public function index()
    {
        $users = User::all();
        return view('admin.users.index', compact('users'));
    }

    /**
     * Show a page of user creation
     * @return \Illuminate\View\View
     */
    public function create()
    {
        $roles = Role::pluck('title', 'id');
        $films = Films::pluck('movie_name', 'id');
       // print_r(  $films);
        return view('admin.users.create', compact('roles'), compact('films'));
    }

    /**
     * Insert new user into the system
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function store(Request $request)
    {
        $input = $request->all();
        $rules = array(
                'first_name'             => 'required',   
                'last_name'             => 'required',                     
                'email'            => 'required|email|unique:users',      
                'password'         => 'required' 
        );
        $validator = Validator::make($request->all(), $rules);
        // if the validator fails, redirect back to the form
        if ($validator->fails()) {           
            return redirect()->route('users.index')->withMessage("Validation error!!");           
        } else {         
            $input['password'] = Hash::make($input['password']);
            $input['verification_code'] = Hash::make($input['password']);
            $user = User::create($input);       
            if(isset($input['film_id'])){
                foreach($input['film_id'] as $selected_id){
                    $film = Films::findOrFail($selected_id);
                    $association  = array('user_id' => $user->id, 'movie_id' => $film->id);
                    $assoc = UserFilms::create($association);
                }
            }

            $fusionMail = new FusionMail( $user);
            $send =    Mail::to($input['email'])->send( $fusionMail);
            var_dump( Mail:: failures());
            return redirect()->route('users.index')->withMessage(trans('quickadmin::admin.users-controller-successfully_created'));

        }
    }

    /**
     * Show a user edit page
     *
     * @param $id
     *
     * @return \Illuminate\View\View
     */
    public function edit($id)
    {
        $user  = User::findOrFail($id);
        $roles = Role::pluck('title', 'id');
        $films = Films::pluck('movie_name', 'id');
        $selectedfilms  = DB::table('user_films')
        ->where('user_id', $user->id)->get()->pluck('movie_id');
        $selected = array_values((array)$selectedfilms);
        $selected = $selected[0] ;
        return view('admin.users.edit', compact('user', 'roles','films','selected'));
    }

    /**
     * Update our user information
     *
     * @param Request $request
     * @param         $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $id)
    {


        $user = User::findOrFail($id);
        $input = $request->all();
        $input['password'] = Hash::make($input['password']);
        $user->update($input);
        $watched  = DB::table('user_films')
        ->where('user_id', $user->id)->get()->pluck('movie_id');
        $watched = array_values((array)$watched);

        foreach($input['film_id'] as $selected_id){
            if(in_array($selected_id, $watched) ){
                 continue; 
             }else
             {
                $selectedfilms  = DB::table('user_films')
                ->where('movie_id', $selected_id)->get()->pluck('movie_id');
                $selected = array_values((array)$selectedfilms);
                $film = Films::findOrFail($selected_id);
                $association  = array('user_id' => $user->id, 'movie_id' => $film->id);
                $assoc = UserFilms::create($association);   
            } 
        }

        foreach ($watched as $key => $movie){
            if(in_array($movie, $selected) ){
                continue;
            }else{
                DB::table('user_films')
                ->where('movie_id', '=', $movie)->delete();  
            }
        }

        return redirect()->route('users.index')->withMessage(trans('quickadmin::admin.users-controller-successfully_updated'));
    }

    /**
     * Destroy specific user
     *
     * @param $id
     *
     * @return \Illuminate\Http\RedirectResponse
     */
    public function destroy($id)
    {
        $user = User::findOrFail($id);
        User::destroy($id);
        return redirect()->route('users.index')->withMessage(trans('quickadmin::admin.users-controller-successfully_deleted'));
    }
}
