import os
import urllib.request
from setuptools import setup, find_packages

def is_gcp():
    """Check for indicators that the environment is GCP (e.g., Vertex notebooks)."""
    try:
        # Check GCE product name
        with open('/sys/class/dmi/id/product_name') as f:
            if 'Google' in f.read():
                return True
    except Exception:
        pass

    # Fallback: try accessing GCP metadata server (won't work in local dev usually)
    try:
        req = urllib.request.Request(
            'http://metadata.google.internal/computeMetadata/v1/',
            headers={'Metadata-Flavor': 'Google'}
        )
        with urllib.request.urlopen(req, timeout=1) as response:
            return response.status == 200
    except Exception:
        pass

    return False

install_requires = []

if is_gcp():
    install_requires += [
        'google-cloud-api-keys',
        'google-auth',
        'google-api-python-client',
    ]
else:
    install_requires += [
        'boto3',
    ]

setup(
    name='llm_helper',
    version='0.1',
    packages=find_packages(),
    install_requires=install_requires,
    py_modules=['gemini_helper', 'bedrock_helper']
)

