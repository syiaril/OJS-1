

<?php exit; // DO NOT DELETE

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; OJS Configuration
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

[general]
app_key = ""
installed = Off
base_url = "<?php echo getenv('BASE_URL'); ?>"
strict = Off
session_cookie_name = OJSSID
session_lifetime = 30
session_samesite = Lax
time_zone = "UTC"
date_format_short = "Y-m-d"
date_format_long = "F j, Y"
datetime_format_short = "Y-m-d h:i A"
datetime_format_long = "F j, Y - h:i A"
time_format = "h:i A"
allow_url_fopen = Off
restful_urls = Off
allowed_hosts = ''
trust_x_forwarded_for = Off
show_upgrade_warning = On
enable_minified = Off
enable_beacon = On
sitewide_privacy_statement = Off
user_validation_period = 28
sandbox = Off

[database]
driver = "<?php echo getenv('DB_DRIVER'); ?>"
host = "<?php echo getenv('DB_HOST'); ?>"
username = "<?php echo getenv('DB_USERNAME'); ?>"
password = "<?php echo getenv('DB_PASSWORD'); ?>"
name = "<?php echo getenv('DB_DATABASE'); ?>"
port = <?php echo getenv('DB_PORT'); ?>
debug = Off

[cache]
default = file
path = cache/opcache
web_cache = Off
web_cache_hours = 1

[i18n]
locale = en
connection_charset = utf8

[files]
files_dir = "<?php echo getenv('OJS_FILES_DIR'); ?>"
public_files_dir = "<?php echo getenv('OJS_PUBLIC_DIR'); ?>"
public_user_dir_size = 5000
umask = 0022

[security]
force_ssl = Off
force_login_ssl = Off
session_check_ip = On
encryption = sha1
salt = "YouMustSetASecretKeyHere!!"
api_key_secret = ""
reset_seconds = 7200
allowed_html = "a[href|target|title],em,strong,cite,code,ul,ol,li[class],dl,dt,dd,b,i,u,img[src|alt],sup,sub,br,p"
allowed_title_html = "b,i,u,sup,sub"

[email]
default = sendmail
sendmail_path = "/usr/sbin/sendmail -bs"
require_validation = Off
validation_timeout = 14

[search]
driver = database
search_index_name = "submissions"
results_per_keyword = 500

[queues]
default_connection = "database"
default_queue = "queue"
job_runner = On
job_runner_max_jobs = 30
job_runner_max_execution_time = 30
job_runner_max_memory = 80
process_jobs_at_task_scheduler = Off
delete_failed_jobs_after = 180

[schedule]
task_runner = On
task_runner_interval = 60
scheduled_tasks_report_error_only = On
