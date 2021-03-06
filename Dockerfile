FROM jspell/flaskv2
MAINTAINER docker@ekito.fr
 
# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron
 
# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron
 
# Create the log file to be able to run tail
RUN touch /var/log/cron.log
RUN touch /var/log/quota.log
 
# Run the command on container startup
CMD cron & python /var/www/quota_mod/run.py
