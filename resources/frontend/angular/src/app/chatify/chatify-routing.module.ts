import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { ChatifyComponent } from './chatify.component';
import { AuthGuard } from '@core/security/auth.guard';

const routes: Routes = [
  {
    path: '',
    component: ChatifyComponent,
    canActivate: [AuthGuard],
    data: { claimType: 'ALL_DOCUMENTS_VIEW_DOCUMENTS' } // Using an existing claim for now
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ChatifyRoutingModule { }
