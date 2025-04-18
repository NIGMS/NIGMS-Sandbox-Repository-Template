from setuptools import setup, find_packages

setup(
    name='gemini_helper',  # The name of your package
    version='0.1',
    packages=find_packages(),  # This will find llm_integrations
    install_requires=[
        # Add any dependencies that are needed for llm_integrations
        'google-cloud-api-keys',  # Example, replace with actual dependencies
        'google-auth',  # Example, replace with actual dependencies
        'google-api-python-client'
    ],
    py_modules=['gemini_helper']
)
