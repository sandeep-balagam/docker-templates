UPDATE core_config_data SET VALUE="https://localhost:8001/pub/" WHERE path IN ("web/unsecure/base_url", "web/secure/base_url", "web/secure/base_link_url");

DELETE FROM core_config_data WHERE path IN (
    "catalog/search/engine",
    
    "catalog/search/elasticsearch5_server_hostname", 
    "catalog/search/elasticsearch5_server_port",  
    "catalog/search/elasticsearch5_index_prefix", 
    "catalog/search/elasticsearch5_enable_auth",
    "catalog/search/elasticsearch5_server_timeout", 
    "catalog/search/elasticsearch5_minimum_should_match",
    
    "catalog/search/elasticsearch7_server_hostname", 
    "catalog/search/elasticsearch7_server_port",  
    "catalog/search/elasticsearch7_index_prefix", 
    "catalog/search/elasticsearch7_enable_auth",
    "catalog/search/elasticsearch7_server_timeout", 
    "catalog/search/elasticsearch7_minimum_should_match",
    
    "catalog/search/opensearch_server_hostname", 
    "catalog/search/opensearch_server_port",  
    "catalog/search/opensearch_index_prefix", 
    "catalog/search/opensearch_enable_auth",
    "catalog/search/opensearch_server_timeout", 
    "catalog/search/opensearch_minimum_should_match"    
    );

INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/engine", "opensearch");
INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_server_hostname", "search");
INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_server_port", "9200");
INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_index_prefix", "magento_");
INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_enable_auth", "0");

INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_server_timeout", "15");
INSERT INTO core_config_data (scope, scope_id, path, value) VALUES(DEFAULT, 0, "catalog/search/opensearch_minimum_should_match", NULL);