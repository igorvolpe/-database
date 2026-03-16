-- Insere Cliente
INSERT INTO customers (name) VALUES ('Eldorado Research Corp');

-- Insere 10 Dispositivos
INSERT INTO devices (customer_id, serial_number, hardware_specs)
SELECT 
    (SELECT id FROM customers LIMIT 1),
    'SN-' || i,
    jsonb_build_object('sensors', jsonb_build_array('temp', 'vibration'))
FROM generate_series(1, 10) s(i);

-- Insere 100.000 Telemetrias (Março de 2026)
INSERT INTO device_telemetry (device_id, ts, payload)
SELECT 
    (SELECT id FROM devices ORDER BY random() LIMIT 1),
    '2026-03-15 10:00:00'::timestamp - (random() * INTERVAL '10 days'),
    jsonb_build_object('temp', random()*50, 'vibration', random())
FROM generate_series(1, 100000) s(i);
