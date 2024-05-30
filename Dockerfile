FROM grafana/grafana:latest

# Create the necessary directories for provisioning
RUN mkdir -p /etc/grafana/provisioning/dashboards /etc/grafana/provisioning/datasources /var/lib/grafana/dashboards

# Copy the dashboard provisioning file
COPY provisioning/dashboards/dashboard.yaml /etc/grafana/provisioning/dashboards/dashboard.yaml

# Copy the data source provisioning file
COPY provisioning/datasources/datasource.yaml /etc/grafana/provisioning/datasources/datasource.yaml

# Copy the dashboard JSON file
COPY dashboards/sample-dashboard.json /var/lib/grafana/dashboards/sample-dashboard.json

# Expose Grafana port
EXPOSE 3000

# Start Grafana
CMD ["/run.sh"]
