CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE customers (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW()
);

CREATE TABLE devices (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    customer_id UUID REFERENCES customers(id),
    serial_number VARCHAR(100) UNIQUE NOT NULL,
    hardware_specs JSONB, 
    last_checkin TIMESTAMP WITH TIME ZONE
);

CREATE TABLE device_telemetry (
    device_id UUID NOT NULL REFERENCES devices(id),
    ts TIMESTAMP WITH TIME ZONE NOT NULL,
    payload JSONB NOT NULL
) PARTITION BY RANGE (ts);

-- Índice GIN para busca dentro do JSONB
CREATE INDEX idx_device_specs ON devices USING GIN (hardware_specs);
