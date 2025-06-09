import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { DocumentInfo, DocumentAttachment } from '@core/domain-classes/document-info';
import { DocumentService } from '../document.service';
import { BaseComponent } from 'src/app/base.component';
import { ToastrService } from 'ngx-toastr';
import { TranslateService } from '@ngx-translate/core';

@Component({
  selector: 'app-document-attachments',
  templateUrl: './document-attachments.component.html',
  styleUrls: ['./document-attachments.component.scss']
})
export class DocumentAttachmentsComponent extends BaseComponent implements OnInit {
  document: DocumentInfo;
  documentId: string;
  loading = false;
  attachments: DocumentAttachment[] = [];

  constructor(
    private documentService: DocumentService,
    private route: ActivatedRoute,
    private router: Router,
    private toastr: ToastrService,
    private translateService: TranslateService
  ) {
    super();
  }

  ngOnInit(): void {
    this.route.paramMap.subscribe(params => {
      this.documentId = params.get('id');
      if (this.documentId) {
        this.getDocument();
      }
    });
  }

  getDocument(): void {
    this.loading = true;
    this.sub$.sink = this.documentService.getDocument(this.documentId)
      .subscribe(
        (document: DocumentInfo) => {
          this.document = document;
          this.attachments = document.documentAttachments || [];
          this.loading = false;
        },
        () => {
          this.loading = false;
          this.toastr.error(this.translateService.instant('ERROR_LOADING_DOCUMENT'));
        }
      );
  }

  downloadAttachment(attachment: DocumentAttachment): void {
    if (attachment.url) {
      window.open(attachment.url, '_blank');
    }
  }

  log(data:any): void{
    console.log(data)
  }

  goBack(): void {
    this.router.navigate(['/documents']);
  }

  goToDocumentDetails(): void {
    this.router.navigate(['/document-details', this.documentId]);
  }
}
