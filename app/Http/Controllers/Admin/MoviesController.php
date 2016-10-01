<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Redirect;
use Schema;
use App\Movies;
use App\Http\Requests\CreateMoivesRequest;
use App\Http\Requests\UpdateMoivesRequest;
use Illuminate\Http\Request;



class MoivesController extends Controller {

	/**
	 * Display a listing of moives
	 *
     * @param Request $request
     *
     * @return \Illuminate\View\View
	 */
	public function index(Request $request)
    {
        $moives = Moives::all();

		return view('admin.moives.index', compact('moives'));
	}

	/**
	 * Show the form for creating a new moives
	 *
     * @return \Illuminate\View\View
	 */
	public function create()
	{
	    
	    
	    return view('admin.moives.create');
	}

	/**
	 * Store a newly created moives in storage.
	 *
     * @param CreateMoivesRequest|Request $request
	 */
	public function store(CreateMoivesRequest $request)
	{
	    
		Moives::create($request->all());

		return redirect()->route(config('quickadmin.route').'.moives.index');
	}

	/**
	 * Show the form for editing the specified moives.
	 *
	 * @param  int  $id
     * @return \Illuminate\View\View
	 */
	public function edit($id)
	{
		$moives = Moives::find($id);
	    
	    
		return view('admin.moives.edit', compact('moives'));
	}

	/**
	 * Update the specified moives in storage.
     * @param UpdateMoivesRequest|Request $request
     *
	 * @param  int  $id
	 */
	public function update($id, UpdateMoivesRequest $request)
	{
		$moives = Moives::findOrFail($id);

        

		$moives->update($request->all());

		return redirect()->route(config('quickadmin.route').'.moives.index');
	}

	/**
	 * Remove the specified moives from storage.
	 *
	 * @param  int  $id
	 */
	public function destroy($id)
	{
		Moives::destroy($id);

		return redirect()->route(config('quickadmin.route').'.moives.index');
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
            Moives::destroy($toDelete);
        } else {
            Moives::whereNotNull('id')->delete();
        }

        return redirect()->route(config('quickadmin.route').'.moives.index');
    }

}
