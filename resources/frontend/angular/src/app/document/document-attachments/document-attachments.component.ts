import { Component, OnInit, ElementRef, ViewChild } from '@angular/core';
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
  selectedFiles: File[] = [];
  @ViewChild('fileInput') fileInput: ElementRef;
  uploadInProgress = false;

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



  deleteAttachment(attachment: DocumentAttachment): void {
    if (confirm(this.translateService.instant('CONFIRM_DELETE_ATTACHMENT'))) {
      this.loading = true;
      this.sub$.sink = this.documentService.deleteAttachment(attachment.id)
        .subscribe(
          () => {
            this.toastr.success(this.translateService.instant('ATTACHMENT_DELETED_SUCCESSFULLY'));
            // Remove the deleted attachment from the list
            this.attachments = this.attachments.filter(a => a.id !== attachment.id);
            this.loading = false;
          },
          (error) => {
            this.loading = false;
            this.toastr.error(this.translateService.instant('ERROR_DELETING_ATTACHMENT'));
            console.error(error);
          }
        );
    }
  }

  goBack(): void {
    this.router.navigate(['/documents']);
  }

  goToDocumentDetails(): void {
    this.router.navigate(['/document-details', this.documentId]);
  }

  onFileSelected(event: any): void {
    this.selectedFiles = Array.from(event.target.files);
    if (this.selectedFiles.length > 0) {
      this.uploadAttachments();
    }
  }

  uploadAttachments(): void {
    if (this.selectedFiles.length === 0) {
      return;
    }

    this.uploadInProgress = true;
    this.loading = true;

    // Extract file names and extensions
    const names = this.selectedFiles.map(file => file.name);
    const extensions = this.selectedFiles.map(file => {
      const parts = file.name.split('.');
      return parts.length > 1 ? parts[parts.length - 1] : '';
    });

    this.sub$.sink = this.documentService.addAttachment(this.documentId, this.selectedFiles, names, extensions)
      .subscribe(
        (response) => {
          this.toastr.success(this.translateService.instant('ATTACHMENTS_ADDED_SUCCESSFULLY'));
          this.getDocument(); // Refresh the attachments list
          this.clearFileInput();
          this.uploadInProgress = false;
          this.loading = false;
        },
        (error) => {
          this.toastr.error(this.translateService.instant('ERROR_ADDING_ATTACHMENTS'));
          console.error(error);
          this.uploadInProgress = false;
          this.loading = false;
        }
      );
  }

  clearFileInput(): void {
    this.selectedFiles = [];
    if (this.fileInput) {
      this.fileInput.nativeElement.value = '';
    }
  }

  openFileSelector(): void {
    if (this.fileInput) {
      this.fileInput.nativeElement.click();
    }
  }
}
