import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MeetingRoutingModule } from './meeting-routing.module';
import { MeetingListComponent } from './meeting-list/meeting-list.component';
import { ManageMeetingComponent } from './manage-meeting/manage-meeting.component';
import { JoinMeetingComponent } from './join-meeting/join-meeting.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { MatButtonModule } from '@angular/material/button';
import { MatCardModule } from '@angular/material/card';
import { MatIconModule } from '@angular/material/icon';
import { MatInputModule } from '@angular/material/input';
import { MatListModule } from '@angular/material/list';
import { MatProgressSpinnerModule } from '@angular/material/progress-spinner';
import { MatDatepickerModule } from '@angular/material/datepicker';
import { MatNativeDateModule } from '@angular/material/core';
import { MatSelectModule } from '@angular/material/select';
import { MatTableModule } from '@angular/material/table';
import { MatTooltipModule } from '@angular/material/tooltip';
import { TranslateModule } from '@ngx-translate/core';
import { SharedModule } from '@shared/shared.module';
import { NgSelectModule } from '@ng-select/ng-select';

@NgModule({
  declarations: [
    MeetingListComponent,
    ManageMeetingComponent,
    JoinMeetingComponent
  ],
  imports: [
    CommonModule,
    MeetingRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    MatButtonModule,
    MatCardModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatProgressSpinnerModule,
    MatDatepickerModule,
    MatNativeDateModule,
    MatSelectModule,
    MatTableModule,
    MatTooltipModule,
    TranslateModule,
    SharedModule,
    NgSelectModule
  ]
})
export class MeetingModule { }
