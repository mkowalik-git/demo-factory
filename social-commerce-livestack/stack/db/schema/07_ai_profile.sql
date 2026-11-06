/*
 * 07_ai_profile.sql
 * OCI GenAI Credential and Select AI Profile Suite
 * Run as SOCIALCOMMERCE — BEFORE 08_agents.sql
 *
 * Creates four profiles that can be switched as needed:
 *   SC_COHERE_PROFILE   — Cohere Command R+ (strong SQL/structured tasks)
 *   SC_LLAMA_PROFILE    — LLaMA 3.3 70B (strong general reasoning)
 *   SC_VISION_PROFILE   — LLaMA 3.2 90B Vision (image analysis)
 *   SC_EMBED_PROFILE    — Cohere Embed v3 (vector embeddings / 04_vector.sql)
 *
 * Default active profile: SC_COHERE_PROFILE
 * Switch profiles any time with: EXEC DBMS_CLOUD_AI.SET_PROFILE('<name>');
 *
 * ── How to run ──────────────────────────────────────────────
 *
 *   Recommended — via shell script (reads .env automatically):
 *     scripts/setup_ai_profile.sh
 *
 *   Manual — SQLcl with values pre-defined:
 *     DEFINE OCI_COMPARTMENT_ID = YOUR_COMPARTMENT_OCID
 *     DEFINE OCI_CRED_NAME      = OCI$RESOURCE_PRINCIPAL
 *     @db/schema/07_ai_profile.sql
 *
 *   Standalone — SQLcl will prompt for each undefined variable.
 *
 * ── Admin prerequisite (one-time per ADB instance) ──────────
 *   EXEC DBMS_CLOUD_ADMIN.ENABLE_PRINCIPAL_AUTH(
 *       provider => 'OCI', feature => 'AI'
 *   );
 */

SET SERVEROUTPUT ON
SET VERIFY OFF


-- OCI credentials are provisioned separately by setup_ai_profile.sh.
-- For manual runs, create the OCI credential first and define OCI_CRED_NAME.




-- ============================================================
-- PROFILE 1: Cohere Command R+ — SQL & structured tasks
-- Best for: Select AI queries, agent tool calls, RAG
-- ============================================================
BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE('SC_COHERE_PROFILE');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'SC_COHERE_PROFILE',
        attributes   => '{
            "provider"        : "oci",
            "credential_name" : "&&OCI_CRED_NAME",
            "oci_compartment_id" : "&&OCI_COMPARTMENT_ID",
            "model"           : "cohere.command-r-plus-08-2024",
            "oci_apiformat"   : "COHERE",
            "max_tokens"      : 2048,
            "temperature"     : 0.2,
            "comments"        : true,
            "object_list"     : [
                {"owner": "SOCIALCOMMERCE", "name": "BRANDS"},
                {"owner": "SOCIALCOMMERCE", "name": "PRODUCTS"},
                {"owner": "SOCIALCOMMERCE", "name": "FULFILLMENT_CENTERS"},
                {"owner": "SOCIALCOMMERCE", "name": "INVENTORY"},
                {"owner": "SOCIALCOMMERCE", "name": "CUSTOMERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDER_ITEMS"},
                {"owner": "SOCIALCOMMERCE", "name": "INFLUENCERS"},
                {"owner": "SOCIALCOMMERCE", "name": "SOCIAL_POSTS"},
                {"owner": "SOCIALCOMMERCE", "name": "POST_PRODUCT_MENTIONS"},
                {"owner": "SOCIALCOMMERCE", "name": "DEMAND_FORECASTS"},
                {"owner": "SOCIALCOMMERCE", "name": "SHIPMENTS"},
                {"owner": "SOCIALCOMMERCE", "name": "AGENT_ACTIONS"}
            ]
        }'
    );
    DBMS_OUTPUT.PUT_LINE('SC_COHERE_PROFILE created  (cohere.command-r-plus-08-2024)');
END;
/

-- ============================================================
-- PROFILE 2: LLaMA 3.3 70B — general reasoning & chat
-- Best for: complex reasoning, agent orchestration, explanations
-- ============================================================
BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE('SC_LLAMA_PROFILE');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'SC_LLAMA_PROFILE',
        attributes   => '{
            "provider"        : "oci",
            "credential_name" : "&&OCI_CRED_NAME",
            "oci_compartment_id" : "&&OCI_COMPARTMENT_ID",
            "model"           : "meta.llama-3.3-70b-instruct",
            "oci_apiformat"   : "GENERIC",
            "max_tokens"      : 2048,
            "temperature"     : 0.2,
            "comments"        : true,
            "object_list"     : [
                {"owner": "SOCIALCOMMERCE", "name": "BRANDS"},
                {"owner": "SOCIALCOMMERCE", "name": "PRODUCTS"},
                {"owner": "SOCIALCOMMERCE", "name": "FULFILLMENT_CENTERS"},
                {"owner": "SOCIALCOMMERCE", "name": "INVENTORY"},
                {"owner": "SOCIALCOMMERCE", "name": "CUSTOMERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDER_ITEMS"},
                {"owner": "SOCIALCOMMERCE", "name": "INFLUENCERS"},
                {"owner": "SOCIALCOMMERCE", "name": "SOCIAL_POSTS"},
                {"owner": "SOCIALCOMMERCE", "name": "POST_PRODUCT_MENTIONS"},
                {"owner": "SOCIALCOMMERCE", "name": "DEMAND_FORECASTS"},
                {"owner": "SOCIALCOMMERCE", "name": "SHIPMENTS"},
                {"owner": "SOCIALCOMMERCE", "name": "AGENT_ACTIONS"}
            ]
        }'
    );
    DBMS_OUTPUT.PUT_LINE('SC_LLAMA_PROFILE created   (meta.llama-3.3-70b-instruct)');
END;
/

-- ============================================================
-- PROFILE 2: LLaMA 3.3 70B — general reasoning & chat
-- Best for: complex reasoning, agent orchestration, explanations
-- ============================================================
BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE('SC_GROK42_PROFILE');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'SC_GROK42_PROFILE',
        attributes   => '{
            "provider"        : "oci",
            "credential_name" : "&&OCI_CRED_NAME",
            "oci_compartment_id" : "&&OCI_COMPARTMENT_ID",
            "model"           : "xai.grok-4.20-0309-reasoning",
            "region"          : "us-chicago-1",
            "oci_apiformat"   : "GENERIC",
            "max_tokens"      : 2048,
            "temperature"     : 0.2,
            "comments"        : true,
            "object_list"     : [
                {"owner": "SOCIALCOMMERCE", "name": "BRANDS"},
                {"owner": "SOCIALCOMMERCE", "name": "PRODUCTS"},
                {"owner": "SOCIALCOMMERCE", "name": "FULFILLMENT_CENTERS"},
                {"owner": "SOCIALCOMMERCE", "name": "INVENTORY"},
                {"owner": "SOCIALCOMMERCE", "name": "CUSTOMERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDERS"},
                {"owner": "SOCIALCOMMERCE", "name": "ORDER_ITEMS"},
                {"owner": "SOCIALCOMMERCE", "name": "INFLUENCERS"},
                {"owner": "SOCIALCOMMERCE", "name": "SOCIAL_POSTS"},
                {"owner": "SOCIALCOMMERCE", "name": "POST_PRODUCT_MENTIONS"},
                {"owner": "SOCIALCOMMERCE", "name": "DEMAND_FORECASTS"},
                {"owner": "SOCIALCOMMERCE", "name": "SHIPMENTS"},
                {"owner": "SOCIALCOMMERCE", "name": "AGENT_ACTIONS"}
            ]
        }'
    );
    DBMS_OUTPUT.PUT_LINE('SC_GROK42_PROFILE created   (xai.grok-4.20-0309-reasoning)');
END;
/

-- ============================================================
-- PROFILE 3: LLaMA 3.2 Vision — image & multimodal analysis
-- Best for: product image tagging, visual content moderation
-- No object_list — used for image analysis, not SQL generation
-- ============================================================
BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE('SC_VISION_PROFILE');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'SC_VISION_PROFILE',
        attributes   => '{
            "provider"        : "oci",
            "credential_name" : "&&OCI_CRED_NAME",
            "oci_compartment_id" : "&&OCI_COMPARTMENT_ID",
            "model"           : "meta.llama-3.2-90b-vision-instruct",
            "oci_apiformat"   : "GENERIC",
            "max_tokens"      : 1024,
            "temperature"     : 0.1
        }'
    );
    DBMS_OUTPUT.PUT_LINE('SC_VISION_PROFILE created  (meta.llama-3.2-90b-vision-instruct)');
END;
/

-- ============================================================
-- PROFILE 4: Cohere Embed v3 — vector embeddings
-- Best for: DBMS_VECTOR.UTL_TO_EMBEDDINGS, semantic search (04_vector.sql)
-- No object_list or chat params — embedding only
-- ============================================================
BEGIN
    BEGIN
        DBMS_CLOUD_AI.DROP_PROFILE('SC_EMBED_PROFILE');
    EXCEPTION WHEN OTHERS THEN NULL;
    END;

    DBMS_CLOUD_AI.CREATE_PROFILE(
        profile_name => 'SC_EMBED_PROFILE',
        attributes   => '{
            "provider"        : "oci",
            "credential_name" : "&&OCI_CRED_NAME",
            "oci_compartment_id" : "&&OCI_COMPARTMENT_ID",   
            "embedding_model" : "cohere.embed-multilingual-v3.0"
        }'
    );
    DBMS_OUTPUT.PUT_LINE('SC_EMBED_PROFILE created   (cohere.embed-multilingual-v3.0)');
END;
/

-- ============================================================
-- SET DEFAULT PROFILE FOR THIS SESSION
-- Cohere is the default — best for Select AI SQL generation
-- and agent tool calls in 08_agents.sql.
-- Switch anytime: EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_LLAMA_PROFILE');
-- ============================================================
BEGIN
    DBMS_CLOUD_AI.SET_PROFILE('SC_COHERE_PROFILE');
    DBMS_OUTPUT.PUT_LINE('Default profile set: SC_COHERE_PROFILE');
END;
/

-- ============================================================
-- VERIFY ALL PROFILES
-- ============================================================
SELECT profile_name,
       status,
       TO_CHAR(created, 'YYYY-MM-DD HH24:MI') AS created
FROM   user_cloud_ai_profiles
ORDER  BY profile_name;

-- ============================================================
-- PROFILE REFERENCE
-- ============================================================
/*
-- Switch profiles mid-session:
EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_COHERE_PROFILE');   -- SQL + agents (default)
EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_LLAMA_PROFILE');    -- general reasoning
EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_VISION_PROFILE');   -- image analysis
EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_EMBED_PROFILE');    -- embeddings

-- Smoke tests (uncomment to verify end-to-end connectivity):
EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_COHERE_PROFILE');
SELECT AI How many brands are in the database;
SELECT AI What are the top 5 products by unit price;

EXEC DBMS_CLOUD_AI.SET_PROFILE('SC_LLAMA_PROFILE');
SELECT AI Summarize the social commerce platform in one paragraph;
*/

-- ============================================================
-- UPDATE 08_agents.sql PROFILE REFERENCES (reminder)
-- 08_agents.sql references "genai" in agent/task attributes.
-- Update those to "SC_COHERE_PROFILE" or "SC_LLAMA_PROFILE"
-- as appropriate for each agent's role.
-- ============================================================

SELECT '07_ai_profile.sql complete — 4 profiles created. Ready for 08_agents.sql.' AS status
FROM dual;
