<?php

namespace Fullcalendar\Fullcalendar;

use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Nova\Menu\MenuSection;
use Laravel\Nova\Nova;
use Laravel\Nova\Tool;

class Fullcalendar extends Tool
{
    /**
     * Perform any tasks that need to happen when the tool is booted.
     *
     * @return void
     */

    protected $usersData;

    public function __construct($usersData)
    {
        $this->usersData = $usersData;
    }

    public function boot()
    {
        Nova::script('fullcalendar', __DIR__ . '/../dist/js/tool.js');
        Nova::style('fullcalendar', __DIR__ . '/../dist/css/tool.css');
    }

    /**
     * Build the menu that renders the navigation links for the tool.
     *
     * @param  \Illuminate\Http\Request $request
     * @return mixed
     */
    public function menu(Request $request)
    {
        return MenuSection::make('Fullcalendar')
            ->path('/fullcalendar')
            ->icon('server');
    }

    public function withUsersData($usersData)
    {
        $this->usersData = $usersData;

        return $this;
    }

    public function renderNavigation()
    {
        return view('fullcalendar::navigation');
    }
}