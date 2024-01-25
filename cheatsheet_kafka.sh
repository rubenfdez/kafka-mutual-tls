
/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --add \
    --allow-principal "User:CN=BPE-kafka-client-ES,OU=Security Architecture,OU=Ether Entity,OU=Client Entity,O=BBVA,C=ES" \
    --operation DescribeConfigs \
    --operation Alter \
    --operation IdempotentWrite \
    --operation Create \
    --operation ClusterAction \
    --operation AlterConfigs \
    --cluster

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --add \
    --allow-principal "User:CN=BPE-kafka-client-ES,OU=Client Entity,OU=Ether Entity,OU=Security Architecture,O=BBVA,C=ES" \
    --operation All \
    --topic '*'

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --add \
    --allow-principal "User:CN=BPE-kafka-client-ES,OU=Security Architecture,OU=Ether Entity,OU=Client Entity,O=BBVA,C=ES" \
    --operation Create \
    --operation Write \
    --operation Read \
    --operation Delete \
    --topic '*'

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --list \
    --cluster

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --list \
    --topic '*'

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --remove \
    --cluster \
    --force

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-acls.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
    --remove \
    --topic '*' \
    --force

## PRODUCER AND CONSUMER ##

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-console-producer.sh \
    --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093,dev-mtls-2.k-core-events.work.es.nextgen.igrupobbva:9093,dev-mtls-3.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --producer.config=/opt/kafka/kafka_2.13-3.0.0/config/client.properties \
    --topic middleware "test 1"


/opt/kafka/kafka_2.13-3.0.0/bin/kafka-console-consumer.sh \
    --bootstrap-server "dev-activitylog-test-1.k-core-events.work.es.nextgen.igrupobbva:9093,dev-activitylog-test-2.k-core-events.work.es.nextgen.igrupobbva:9093,dev-activitylog-test-3.k-core-events.work.es.nextgen.igrupobbva:9093" \
    --consumer.config=/opt/kafka/kafka_2.13-3.0.0/config/client.properties \
    --from-beginning \
    --topic middleware

## TOPICS ADMIN ##

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-topics.sh \
        --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
        --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
        --create \
        --partitions 1 \
        --replication-factor 1 \
        --topic antuan_admin

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-topics.sh \
      --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
      --command-config "/opt/kafka/kafka_2.13-3.0.0/config/admin.properties" \
      --list

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-topics.sh \
        --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
        --command-config=/opt/kafka/kafka_2.13-3.0.0/config/admin.properties \
        --delete \
        --topic *

## TOPICS CLIENT ##

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-topics.sh \
        --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
        --command-config=/opt/kafka/kafka_2.13-3.0.0/config/client.properties \
        --create \
        --partitions 1 \
        --replication-factor 1 \
        --topic antuan

/opt/kafka/kafka_2.13-3.0.0/bin/kafka-topics.sh \
      --bootstrap-server "dev-mtls-1.k-core-events.work.es.nextgen.igrupobbva:9093" \
      --command-config "/opt/kafka/kafka_2.13-3.0.0/config/client.properties" \
      --list


