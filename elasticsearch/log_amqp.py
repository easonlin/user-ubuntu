import logging
logging.basicConfig(level=logging.DEBUG)
import logstash

test_logger = logging.getLogger('python-logstash-logger')
test_logger.addHandler(logstash.AMQPLogstashHandler(host='10.201.174.191', version=1,  exchange='logstash-sco'))

test_logger.info('python-logstash: test logstash info message.')
try:
    1/0
except:
    test_logger.exception('python-logstash-logger: Exception with stack trace!')
