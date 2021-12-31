@echo off
   TITLE SQL Database Backup
   set BACKUP_FILE=airport_sys_backup.sql
   echo backup file name is %BACKUP_FILE%
   SET PGPASSWORD=postgres
   echo on
   bin\pg_dump -U postgres -d airport > E:\BDSM\bds-java-fx-project\backup\%BACKUP_FILE%
   PAUSE