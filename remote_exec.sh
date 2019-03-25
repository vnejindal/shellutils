# set -x

REMOTE=$1
shift

ssh -t -i ~/jenkins_tf.pem ubuntu@${REMOTE} $*
