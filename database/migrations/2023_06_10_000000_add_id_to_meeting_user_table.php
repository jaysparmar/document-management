<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class AddIdToMeetingUserTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        // First, check if the table exists
        if (Schema::hasTable('meeting_user')) {
            // Check if the id column already exists
            if (!Schema::hasColumn('meeting_user', 'id')) {
                // Create a temporary table with the new structure
                Schema::create('meeting_user_temp', function (Blueprint $table) {
                    $table->uuid('id')->primary();
                    $table->uuid('meeting_id');
                    $table->uuid('user_id');
                    $table->boolean('is_accepted')->default(false);
                    $table->timestamps();

                    $table->foreign('meeting_id')->references('id')->on('meetings')->onDelete('cascade');
                    $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
                });

                // Copy data from the old table to the new one, generating UUIDs for the id column
                DB::statement('INSERT INTO meeting_user_temp (id, meeting_id, user_id, is_accepted, created_at, updated_at)
                              SELECT UUID(), meeting_id, user_id, is_accepted, created_at, updated_at FROM meeting_user');

                // Drop the old table
                Schema::drop('meeting_user');

                // Rename the temporary table to the original name
                Schema::rename('meeting_user_temp', 'meeting_user');
            }
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // This is a destructive operation, so we'll just provide a warning
        // If you need to roll back, you would need to recreate the original table structure
        if (Schema::hasTable('meeting_user') && Schema::hasColumn('meeting_user', 'id')) {
            Schema::table('meeting_user', function (Blueprint $table) {
                $table->dropColumn('id');
            });
        }
    }
}
