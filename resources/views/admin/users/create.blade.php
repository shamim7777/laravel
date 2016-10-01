@extends('admin.layouts.master')

@section('content')
 
    <div class="row">
        <div class="col-sm-10 col-sm-offset-2">
            <h1>{{ trans('quickadmin::admin.users-create-create_user') }}</h1>

            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        {!! implode('', $errors->all('
                        <li class="error">:message</li>
                        ')) !!}
                    </ul>
                </div>
            @endif
        </div>
    </div>

    {!! Form::open(['route' => 'users.store', 'class' => 'form-horizontal']) !!}

    <div class="form-group">
        {!! Form::label('name', trans('quickadmin::admin.users-create-first-name'), ['class'=>'col-sm-2 control-label']) !!}*
        <div class="col-sm-10">
            {!! Form::text('first_name', old('first_name'), ['class'=>'form-control','required'=>'required', 'placeholder'=> trans('quickadmin::admin.users-create-first-name_placeholder')]) !!}
        </div>
    </div>

    <div class="form-group">
        {!! Form::label('name', trans('quickadmin::admin.users-create-last-name'), ['class'=>'col-sm-2 control-label']) !!}*
        <div class="col-sm-10">
            {!! Form::text('last_name', old('last_name'), ['class'=>'form-control','required'=>'required', 'placeholder'=> trans('quickadmin::admin.users-create-last-name_placeholder')]) !!}
        </div>
    </div>

    <div class="form-group">
        {!! Form::label('email', trans('quickadmin::admin.users-create-email'), ['class'=>'col-sm-2 control-label']) !!}*
        <div class="col-sm-10">
            {!! Form::email('email', old('email'), ['class'=>'form-control','required'=>'required', 'placeholder'=> trans('quickadmin::admin.users-create-email_placeholder')]) !!}
        </div>
    </div>

    <div class="form-group">
        {!! Form::label('password', trans('quickadmin::admin.users-create-password'), ['class'=>'col-sm-2 control-label']) !!}*
        <div class="col-sm-10">
            {!! Form::password('password', ['class'=>'form-control','required'=>'required', 'placeholder'=> trans('quickadmin::admin.users-create-password_placeholder')]) !!}
        </div>
    </div>

    <div class="form-group">
        {!! Form::label('role_id', trans('quickadmin::admin.users-create-role'), ['class'=>'col-sm-2 control-label']) !!}*
        <div class="col-sm-10">
            {!! Form::select('role_id', $roles, old('role_id'), ['class'=>'form-control','required'=>'required']) !!}
        </div>
    </div>

    <div class="form-group film">
        {!! Form::label('admin', trans('quickadmin::admin.users-associate-films'), ['class'=>'col-sm-2 control-label']) !!}
        <div class="col-sm-10">
          {!! Form::select('film_id[]', $films, old('film_id'),  ['multiple' => 'multiple'],['class'=>'form-control']) !!}
        </div>
    </div>


<link rel="stylesheet" href="https://selectize.github.io/selectize.js/css/selectize.default.css" data-theme="default">
 <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script type="text/javascript" src="https://selectize.github.io/selectize.js/js/selectize.js"></script>

    <script>

            $('.film select').selectize({
                delimiter: ',',
                persist: false,
                create: function(input) {
                    return {
                      //  tag: input
                    }
                }
            });
       

       

    /*
       $('#select-movie').selectize({
            valueField: 'title',
            labelField: 'title',
            searchField: 'title',
            options: [],
            create: false,
            render: {
                option: function(item, escape) {
                    var actors = [];
                    for (var i = 0, n = item.abridged_cast.length; i < n; i++) {
                        actors.push('<span>' + escape(item.abridged_cast[i].name) + '</span>');
                    }

                    return '<div>' +
                        '<img src="' + escape(item.posters.thumbnail) + '" alt="">' +
                        '<span class="title">' +
                            '<span class="name">' + escape(item.title) + '</span>' +
                        '</span>' +
                        '<span class="description">' + escape(item.synopsis || 'No synopsis available at this time.') + '</span>' +
                        '<span class="actors">' + (actors.length ? 'Starring ' + actors.join(', ') : 'Actors unavailable') + '</span>' +
                    '</div>';
                }
            },
            load: function(query, callback) {
                if (!query.length) return callback();
                $.ajax({
                    url: 'http://api.rottentomatoes.com/api/public/v1.0/movies.json',
                    type: 'GET',
                    dataType: 'jsonp',
                    data: {
                        q: query,
                        page_limit: 10,
                        apikey: 'w82gs68n8m2gur98m6du5ugc'
                    },
                    error: function() {
                        callback();
                    },
                    success: function(res) {
                        callback(res.movies);
                    }
                });
            }
        });
        */


    </script>


    <div class="form-group">
        <div class="col-sm-10 col-sm-offset-2">
            {!! Form::submit(trans('quickadmin::admin.users-create-btncreate'), ['class' => 'btn btn-primary']) !!}
        </div>
    </div>

    {!! Form::close() !!}

@endsection


