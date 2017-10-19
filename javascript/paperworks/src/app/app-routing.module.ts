import { NgModule } from '@angular/core';
import { RouterModule, Routes }   from '@angular/router';

import { ListFormsComponent } from './list-forms/list-forms.component';
import { DashboardComponent } from './dashboard/dashboard.component';

const routes: Routes = [
  {
    path: '',
    redirectTo: '/dashboard',
    pathMatch: 'full'
  },
  {
    path: 'dashboard',
    component: DashboardComponent
  },
  {
    path: 'agency/:agencyName/:subgroup',
    component: ListFormsComponent
  }
];

@NgModule({
  imports: [ RouterModule.forRoot(routes) ],
  exports: [ RouterModule ]
})

export class AppRoutingModule { }
