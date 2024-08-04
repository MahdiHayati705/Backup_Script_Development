<h1 align="center">
<strong>Backup_Script_Development</strong>
</h1>

This repo focuses on the creation of a shell script designed to efficiently perform backup operations and generate comprehensive logs.

## **Objective**

Develop a bash shell script capable of:

- Executing backup operations for specified directories. The script will backup everything within the `Source Path`, put them all in a zip file, and put the zip file within the `Destination Path`.
- Generating detailed logs covering various aspects of the backup process, such as file specifics, timestamps, and system data.

---

**Sample Backup Log Report**

- **Date:** `2024-02-29`
- **Time:** `14:00:00 UTC`

**Machine Information:**

- **Operating System:** `Linux server 5.4.0-42-generic #46-Ubuntu SMP Fri Jul 10 00:24:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux`

**Backup Details:**

- **Source Path:** `/home/user/data`
- **Destination Path:** `/mnt/backup/2024-02-29_data_backup.zip`
- **Compression Level:** `9`
- **Files Backed Up:** `1,250`
- **Directories Backed Up:** `75`

**Backup Summary:**

- **Start Time:** `14:00:00 UTC`
- **End Time:** `14:05:30 UTC`
- **Total Duration:** `5 minutes 30 seconds`

---

### **Example Command**

```bash
./backup_script.sh /home/user/documents /home/user/backup -c 9
```

### **Example Outcome**

```text
Backup of /home/user/documents completed successfully.
Saved to /home/user/backup/2024-02-29_documents.zip
```

