<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDocumentAttachmentsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('document_attachments', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->uuid('documentId');
            $table->string('name');
            $table->string('url');
            $table->string('extension');
            $table->uuid('createdBy');
            $table->uuid('modifiedBy');
            $table->string('location')->default('local');
            $table->timestamp('createdDate');
            $table->timestamp('modifiedDate')->nullable();

            $table->foreign('documentId')->references('id')->on('documents')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('document_attachments');
    }
}
