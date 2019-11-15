#!/bin/bash

dates=$(date +%Y%m%d)
times=$(date +%H%M)

[ -d /sftp/logs/${dates}/${times} ] || mkdir -p /sftp/logs/${dates}/${times}

for app in prod-communication-sms-v1  prod-home-delivery-process-v1  prod-online-order-processing-v1  prod-payment-processing-v1 prod-order-tracking-process-v1 prod-customer-profile-v1  prod-online-catalog-feed-v1 prod-home-delivery-process-v1  prod-hybris-system-v1

do
	docker run --rm -v /sftp/logs/${dates}/${times}:/mnt -it integrational/anypoint-cli:3.0.0 --username=praveensams16 --password=Samhome@162 runtime-mgr cloudhub-application download-logs $app /mnt
done


