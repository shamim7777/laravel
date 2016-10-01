<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Films;
use App\Http\Requests\CreateFilmsRequest;
use App\Http\Requests\UpdateFilmsRequest;
use Illuminate\Http\Request;



class FilmsController extends Controller {

	/**
	 * Display a listing of films
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $films = Films::all();

		return view('admin.films.index', compact('films'));
	}

	/**
	 * Show the form for creating a new films
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.films.create');
	}

	/**
	 * Store a newly created films in storage.
	 *
     * @param CreateFilmsRequest|Request $request
	 */
	public function store(CreateFilmsRequest $request)
	{
	    
		Films::create($request->all());

		return redirect()->route(config('quickadmin.route').'.films.index');
	}

	/**
	 * Show the form for editing the specified films.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$films = Films::find($id);
	    
	    
		return view('admin.films.edit', compact('films'));
	}

	/**
	 * Update the specified films in storage.
     * @param UpdateFilmsRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateFilmsRequest $request)
	{
		$films = Films::findOrFail($id);

        

		$films->update($request->all());

		return redirect()->route(config('quickadmin.route').'.films.index');
	}

	/**
	 * Remove the specified films from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Films::destroy($id);

		return redirect()->route(config('quickadmin.route').'.films.index');
	}

    /**
     * Mass delete function from index page
     * @param Request $request
     *
     * @return mixed
     */
    public function massDelete(Request $request)
    {
        if ($request->get('toDelete') != 'mass') {
            $toDelete = json_decode($request->get('toDelete'));
            Films::destroy($toDelete);
        } else {
            Films::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.films.index');
    }

}
