import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuard } from '@core/security/auth.guard';
import { MeetingListComponent } from './meeting-list/meeting-list.component';
import { ManageMeetingComponent } from './manage-meeting/manage-meeting.component';
import { JoinMeetingComponent } from './join-meeting/join-meeting.component';

const routes: Routes = [
  {
    path: '',
    component: MeetingListComponent,
    canActivate: [AuthGuard],
    data: { claimType: '' } // No specific claim required
  },
  {
    path: 'add',
    component: ManageMeetingComponent,
    canActivate: [AuthGuard],
    data: { claimType: '' } // No specific claim required
  },
  {
    path: 'edit/:id',
    component: ManageMeetingComponent,
    canActivate: [AuthGuard],
    data: { claimType: '' } // No specific claim required
  },
  {
    path: 'join/:id',
    component: JoinMeetingComponent,
    canActivate: [AuthGuard],
    data: { claimType: '' } // No specific claim required
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MeetingRoutingModule { }
