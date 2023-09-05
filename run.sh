#!/bin/bash

# This is a shell script to apply Kubernetes manifests using kubectl.

# Set the Kubernetes namespace (optional, remove if not needed)
NAMESPACE="your-namespace"

# Loop through all YAML files in the current directory and apply them
for file in *.yaml; do
    if [ -f "$file" ]; then
        echo "Applying $file..."
        if [ -n "$NAMESPACE" ]; then
            kubectl apply -f "$file" -n "$NAMESPACE"
        else
            kubectl apply -f "$file"
        fi
        echo "Applied $file"
    fi
done
