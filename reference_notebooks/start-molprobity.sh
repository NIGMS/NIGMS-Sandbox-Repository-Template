#! /bin/bash
apt-get update
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
export GCSFUSE_REPO=gcsfuse-`lsb_release -c -s` && echo "deb https://packages.cloud.google.com/apt $GCSFUSE_REPO main" | tee /etc/apt/sources.list.d/gcsfuse.list > /dev/null
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin fuse gcsfuse -y
mkdir "/tmp/mount-folder" && chmod 777 /tmp/mount-folder && mount -t gcsfuse -o allow_other,file_mode=777,dir_mode=777 nigms-nosi-developers-us-notebooks "/tmp/mount-folder" 
docker run --rm -v /tmp/mount-folder:/config/s3 -p 8080:3000 us-east4-docker.pkg.dev/nih-cl-shared-resources/nigms-sandbox/molprobity
