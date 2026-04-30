FROM matrixdotorg/synapse:1.151.0

# Copy module from build context
COPY ./modules/matrix_encryption_disabler /opt/matrix_encryption_disabler

# Install the module
RUN pip install /opt/matrix_encryption_disabler