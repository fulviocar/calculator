#!/bin/bash
set -x

NODE_IP=$(kubectl --kubeconfig=/config get nodes -o jsonpath={.items[1].status.addresses[?\(@.type==\"InternalIP\"\)].address})
NODE_PORT=$(kubectl --kubeconfig=/config get svc calculator-service -o=jsonpath='{.spec.ports[0].nodePort}')

test $(curl ${NODE_IP}:${NODE_PORT}/sum?a=1\&b=2) -eq 3
test $(curl ${NODE_IP}:${NODE_PORT}/sum?a=1\&b=2) -eq 3
test $(curl ${NODE_IP}:${NODE_PORT}/sum?a=1\&b=2) -eq 3