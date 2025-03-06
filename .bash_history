export GOOGLE_CLOUD_PROJECT=$(gcloud config get-value core/project)
gcloud iam service-accounts create my-docai-sa   --display-name "my-docai-service-account"
gcloud projects add-iam-policy-binding ${GOOGLE_CLOUD_PROJECT}     --member="serviceAccount:my-docai-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"     --role="roles/documentai.admin"
gcloud projects add-iam-policy-binding ${GOOGLE_CLOUD_PROJECT}     --member="serviceAccount:my-docai-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"     --role="roles/storage.admin"
gcloud projects add-iam-policy-binding ${GOOGLE_CLOUD_PROJECT}     --member="serviceAccount:my-docai-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com"     --role="roles/serviceusage.serviceUsageConsumer"
gcloud iam service-accounts keys create ~/key.json   --iam-account  my-docai-sa@${GOOGLE_CLOUD_PROJECT}.iam.gserviceaccount.com
export GOOGLE_APPLICATION_CREDENTIALS=$(realpath key.json)
pip3 install --upgrade google-cloud-documentai
pip3 install --upgrade google-cloud-storage
gcloud storage cp gs://cloud-samples-data/documentai/codelabs/ocr/Winnie_the_Pooh_3_Pages.pdf .
vim online_processing.py
python3 online_processing.py
gcloud storage buckets create gs://$GOOGLE_CLOUD_PROJECT
gcloud storage cp gs://cloud-samples-data/documentai/codelabs/ocr/Winnie_the_Pooh.pdf gs://$GOOGLE_CLOUD_PROJECT/
vim batch_processing.py
python3 batch_processing.py
gsutil -m cp -r gs://cloud-samples-data/documentai/codelabs/ocr/multi-document/* gs://$GOOGLE_CLOUD_PROJECT/multi-document/
vim batch_processing_directory.py
python3 batch_processing_directory.py
git config user.name "niraaaaliiii"
git config user.email "nirali.h.rathod@gmail.com"
