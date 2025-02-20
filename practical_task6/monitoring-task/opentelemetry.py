from opencensus.ext.azure.log_exporter import AzureLogHandler
import logging

# Настройка логгера
logger = logging.getLogger(__name__)
logger.addHandler(AzureLogHandler(connection_string='InstrumentationKey='))


