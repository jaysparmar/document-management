<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        Schema::table('ch_messages', function (Blueprint $table) {
            // Safely modify columns even if foreign keys are present
            $table->char('from_id', 36)->change();
            $table->char('to_id', 36)->change();
        });

        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }

    public function down()
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0');

        Schema::table('ch_messages', function (Blueprint $table) {
            $table->unsignedBigInteger('from_id')->change();
            $table->unsignedBigInteger('to_id')->change();
        });

        DB::statement('SET FOREIGN_KEY_CHECKS=1');
    }
};
