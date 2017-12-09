-- replace 'steam:110000xxxxxx' by steam of the one you want to delete

DELETE FROM addon_account_data WHERE owner = 'steam:110000xxxxxx';
DELETE FROM addon_inventory_items WHERE owner = 'steam:110000xxxxxx';
DELETE FROM billing WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM billing WHERE sender = 'steam:110000xxxxxx';
DELETE FROM datastore_data WHERE owner = 'steam:110000xxxxxx';
DELETE FROM owned_properties WHERE owner = 'steam:110000xxxxxx';
DELETE FROM owned_vehicles WHERE owner = 'steam:110000xxxxxx';
DELETE FROM playersTattoos WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM rented_vehicles WHERE owner = 'steam:110000xxxxxx';
DELETE FROM user_accounts WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM user_contacts WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM user_inventory WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM user_licenses WHERE owner = 'steam:110000xxxxxx';
DELETE FROM user_parkings WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM user_contacts WHERE number IN (SELECT phone_number FROM users WHERE 'steam:110000xxxxxx');
DELETE FROM characters WHERE identifier = 'steam:110000xxxxxx';
DELETE FROM users WHERE identifier = 'steam:110000xxxxxx';
