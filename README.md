
FileHelper
  file helper
    get file name from url
[32m      is expected to eq "test_image.jpeg"[0m
    get_content_type_from_file_name
[32m      is expected to eq "image/png"[0m

PackageHelper
  Check Warehouse Availability
[32m    has stock[0m
[32m    has no stock[0m

PickListHelper
  auto_outward_pick_list_helper
    Auto Outward Picklist
[32m      is expected to receive perform_async(1, Array) 1 time[0m

VariantApiHelper
  variant_api_handler - update_carton_unit
    update_carton_unit - for variant with variant_market_place_mapping
[32m      should update variant carton unit[0m
    update_carton_unit - for variant without variant_market_place_mapping
[32m      should update variant carton unit[0m

VariantApiHelper
  variant_api_handler - update_price_data
    update_price_data
[32m      should update variant price[0m

VariantApiHelper
  variant_api_handler - update_supplier_data
    update_supplier_data
[32m      should update supplier id[0m

VariantApiHelper
  variant_api_handler - update_variant_state
    update_variant_state from active to inactive
[32m      variant state will be updated[0m
    update_variant_state from inactive to active
[32m      variant state will be updated[0m

VariantApiHelper
  create_variants
[32m    should create variants for corresponding marketplace[0m
  update_sku_data
[32m    should update variant data[0m
  update_variant_title
[32m    should update notes[0m
  update_upc_code
[32m    should update variant data[0m

PickList
  model functions
    Orders
      Pick list orders
[32m        should return orders associated with that pick_list[0m

PickupAgent
  Model functions
    push_agent_for_stock_sync
[32m      is expected to receive perform_async([1]) 1 time[0m

PurchaseOrderLineItem
  Associations
[32m    is expected to belong to purchase_order[0m
[32m    is expected to belong to variant[0m
[32m    is expected to have many grn_items[0m
  validations
    validate_uniquenes of
[32m      is expected to validate that :purchase_order_id is case-sensitively unique within the scope of :variant_id, producing a custom validation error on failure[0m
    validate_numericality of
[32m      is expected to validate that :ordered_quantity looks like a number[0m

PurchaseOrder
  Associations
[32m    is expected to belong to seller[0m
[32m    is expected to belong to warehouse[0m
[32m    is expected to belong to warehouse[0m
[32m    is expected to have many purchase_order_line_items dependent => destroy[0m
[32m    is expected to have many packages[0m
[32m    is expected to have many grns[0m
  model functions
    source_type
[32m      is expected to eq "Wholesale Shop"[0m
    get_bin_type
[32m      is expected to eq 30[0m
    baki collection
[32m      callback should be called[0m
[32m      should trigger worker on api call fail[0m

Seller
  Associations
[32m    is expected to have many seller_warehouse_mappings[0m
[32m    is expected to have many seller_market_place_mappings[0m
[32m    is expected to have many variants[0m
[32m    is expected to have many purchase_orders[0m
[32m    is expected to have many orders[0m
[32m    is expected to have one seller_address[0m
[32m    is expected to have many supplier_seller_mappings dependent => destroy[0m
  validations
    validates_uniqueness_of
[32m      is expected to validate that :name is case-insensitively unique within the scope of :vaccount_id, producing a custom validation error on failure[0m

SellerWarehouseMapping
  Associations
[32m    is expected to belong to seller[0m
[32m    is expected to belong to warehouse[0m
  model functions
    update_seller_address_in_market_places
[32m      should update address in market place[0m

SupplierSellerMapping
  Associations
[32m    is expected to belong to seller[0m
  validations
    validates_uniqueness_of
[32m      is expected to validate that :supplier_id is case-sensitively unique within the scope of :seller_id, producing a custom validation error on failure[0m

TransferOrder
  Associations
[32m    is expected to belong to destination_warehouse class_name => Warehouse[0m
[32m    is expected to belong to source_warehouse class_name => Warehouse[0m
[32m    is expected to have many transfer_order_line_items[0m
  model functions
    Create PO in destination warehouse
      No TO_line_items (MWS)
[32m        should not create po if line items are not present[0m
      TO line items are present (MWS)
[32m        should create po[0m
      TO line items are present (FFC)
[32m        should create po[0m
    Create baki after TO creation
[32m      should create baki[0m
[32m      should not create baki for non mws to[0m
[32m      should call retry worker on fail[0m
[32m      should not call baki if credit validation fails[0m
    cancel TO baki
[32m      should close baki on TO cancellation[0m
[32m      should call retry worker on fail[0m

VariantMarketPlaceMapping
  Associations
[32m    is expected to belong to variant[0m
[32m    is expected to belong to market_place[0m
  validations
    validates_uniqueness_of
[32m      is expected to validate that :uvid is case-insensitively unique within the scope of :market_place_id, producing a custom validation error on failure[0m

Variant
  Associations
[32m    is expected to belong to seller[0m
[32m    is expected to belong to category[0m
[32m    is expected to have many variant_market_place_mappings[0m
[32m    is expected to have many market_places through variant_market_place_mappings[0m
[32m    is expected to have many variant_warehouse_mappings[0m
[32m    is expected to have many warehouses through variant_warehouse_mappings[0m
[32m    is expected to have many purchase_order_line_items[0m
[32m    is expected to have many transfer_order_line_items[0m
[32m    is expected to have many packages[0m
[32m    is expected to have many pick_list_items[0m
[32m    is expected to have many order_line_items[0m
[32m    is expected to have many cancelled_line_items[0m
[32m    is expected to have many attachments[0m
[32m    is expected to have many bin_details[0m
[32m    is expected to have many capacity_logs[0m
  validations
    validates_uniqueness_of
[32m      is expected to validate that :seller_id is case-insensitively unique within the scope of :sku_code, producing a custom validation error on failure[0m
  model functions
    Warehouse wise stock and warehouse_wise_stock_count_for_stock_sync
[32m      should not skip any warehouse[0m
[32m      should skip specific warehouses[0m

WarehouseBin
  Associations
[32m    is expected to belong to warehouse[0m
[32m    is expected to have many bin_details[0m
[32m    is expected to have many packages[0m
[32m    is expected to have many pick_list_items[0m
[32m    is expected to have many capacity_logs[0m
  validations
    validates_presence_of
[32m      is expected to validate that :bin_code cannot be empty/falsy[0m
    validates_uniqueness_of
[32m      is expected to validate that :bin_code is case-insensitively unique[0m
    should not add multiple bins of same type for single bin warehouses
[32m      is expected to include "Cannot add multiple bins of same type"[0m

Warehouse
  Associations
[32m    is expected to have many warehouse_bins[0m
[32m    is expected to have many pick_lists[0m
[32m    is expected to have many warehouse_configs[0m
[32m    is expected to have many warehouse_user_mappings dependent => destroy[0m
[32m    is expected to have many users through warehouse_user_mappings[0m
[32m    is expected to have many packages[0m
[32m    is expected to have many orders[0m
[32m    is expected to have many seller_warehouse_mappings dependent => destroy[0m
[32m    is expected to have many sellers through seller_warehouse_mappings[0m
[32m    is expected to have many warehouse_supplier_mappings dependent => destroy[0m
[32m    is expected to have many variant_warehouse_mappings[0m
[32m    is expected to have many variants through variant_warehouse_mappings[0m
[32m    is expected to have many zone_mappings class_name => WarehouseZoneMapping[0m
  validations
    validates_uniqueness_of
[32m      is expected to validate that :code is case-insensitively unique within the scope of :vaccount_id, producing a custom validation error on failure[0m
  #methods
    #reconcile_orders_assignable
      when bin details count mismatch with packages quantity
[32m        reconciles bin details[0m
      when bin details is not present
[32m        creates bin details[0m
      when bin details count mismatch with group packages quantity
[32m        reconciles bin details[0m
      when bin details not present for group packages
[32m        reconciles bin details[0m
      when bin details are present and packages are not present
[32m        reconciles bin details[0m
    post_approval_changes
      For new warehouse without bins and user mapping
[32m        should create bins and add user_mappings on approval[0m
      bins are already present and warehouse_user_mappings already present
[32m        should create bins and add user_mappings on approval (bins are already present)[0m
      bins are already present and nil response from identity service
[32m        should create bins and add user_mappings on approval (bins are already present)[0m
    allow wh sync
      sync allowed warehouse
[32m        should return true[0m
      sync disallowed warehouse
[32m        should return false[0m
    is normal warehouse
      success case
[32m        is expected to be truthy[0m
      failure case
[32m        is expected to eq false[0m
    general wh function
      is_labelling_warehouse
[32m        is expected to eq false[0m
      is_non_labelling_warehouse
[32m        is expected to eq false[0m
      is_single_bin_warehouse
[32m        is expected to eq true[0m
  scopes
    ordered
[32m      should be ordered (asc) based on warehouse code when scope is used[0m
[32m      should not be ordered (asc) based on warehouse code when scope is not used[0m
  helper
    previous_stock_audit_date
[32m      should return previous friday[0m
[32m      should return previous saturday[0m
[32m      should return today[0m

AdminReport
  GET admin_reports/
    Admin reports index
[32m      should return admin reports[0m

Config
  GET config/
[32m    should return configs[0m

demands_controller
  POST Create Demand
[32m    invalid mws code[0m
[32m    with invalid sku[0m
[32m    with duplicate sku[0m
[32m    with quantity as 0[0m
[32m    with valid data[0m

demands_controller
  POST Create Transfer Order
[32m    Demand ids does not belong to same ffc[0m
    create demand TO
[32m      Demand ids does not belong to same ffc[0m
    create demand TO
[32m      Demand ids does not belong to same warehouse[0m
    create demand TO
[32m      Demand ids does not belong to same warehouse[0m
    create demand TO
[32m      Demand not fulfilled[0m
    create demand TO
[31m      create success (FAILED - 1)[0m
    create demand TO with few variants not fulfilled
[32m      create success[0m
    create demand TO
[32m      should not create to[0m

demands_controller
  GET List Demand
[32m    list all demands for ffc[0m
[32m    filter by mws warehouse[0m
[32m    filter by status[0m
[31m    filter by from_date and to_date (FAILED - 2)[0m

demands_controller
  GET SKU Summary
[32m    get sku summary[0m

demands_controller
  POST Sync Demand
    failure case
[32m      return false[0m
    success case
[32m      return true[0m

demands_controller
  POST Update Status
[32m    demand not found[0m
    updating status to partially fulfilled
[32m      demand is not open[0m
    updating status to partially fulfilled
[32m      demand has no fulfilled items[0m
    updating status to partially fulfilled
[32m      demand partially fulfilled success[0m
    updating status to partially fulfilled with create sub_demand
[32m      demand partially fulfilled success[0m
    updating status to cancelled
[32m      demand already cancelled[0m
    updating status to cancelled
[32m      demand cancel success[0m

Grn
  POST grns
    create grn success
[32m      create grn and update PO status as received[0m
    create grn failure service validation failure
[32m      is expected to respond with numeric status code 200[0m
    create grn failure model error (received qty is higher than ordered qty)
[32m      is expected to respond with numeric status code 200[0m
    create grn failure(invalid sourceable type)
[32m      is expected to respond with numeric status code 200[0m
    create grn failure model error (packages_assignable issue)
[32m      is expected to respond with numeric status code 200[0m
    When no qty is received
[32m      should throw error[0m

GrnsController
  POST     /grns/edit_lifting_price
    edit lifting price of valid grn
[32m      will update lifiting price for provided grn items[0m
    edit lifting price of valid grn with negative price
[32m      lifiting price will not be updated[0m
    edit lifting price of invalid grn - already reconciled
[32m      lifiting price will not be updated[0m
    edit lifting price of invalid grn - non exisiting
[32m      lifiting price will not be updated[0m

GrnsController
  GET      /grns
    grn - index without filter
[32m      all grns will be obtained in response[0m
    grn - index with filter
[32m      grn which matchs the filter params will be obtained in response[0m

Orders
  POST create order
    create valid order with valid params
[32m      should create an order with proper order line items and order details[0m
    create valid order for user with no valid marketplace mapping
[32m      should not create an order[0m
    create valid order with empty warehouse_id params
[32m      should not create an order[0m

Orders
  GET /orders/get_order_details
    get order details with package id as params
[32m      should get order details of the given package id[0m
    get order details with package ref number as params
[32m      should get order details of the given package[0m

Orders
  GET  /orders/get_order_logs
    get order detail logs with order number as params
[32m      should get order detail logs of the order[0m

Orders
  GET /orders/get_returned_group_packages
    get qc passed returned group packages with qc pass state as params
[32m      should get packages details of the given status[0m
    get qc failed returned group packages with qc fail state as params
[32m      should get packages details of the given status[0m
    get qc passed returned group packages with qc pass state as params
[32m      should not get packages details of the given status[0m

Orders
  GET /orders
    existing order data with all params
[32m      should show all existing orders filtered by the given params[0m
    get order data without params except per_page and page
[32m      should show all existing orders[0m
    get order data with variant info in params
[32m      should show all existing orders filtered by variant id[0m
    get order data with order type = 3
[32m      should show all existing orders with order type 3[0m
    get order data with from_date to to_date
[32m      should show all existing orders within the date range[0m

Orders
  POST /orders/inward_return_order
    inward return with valid order number params qc pass
[32m      should update the status and create entry in order details[0m
    inward return with valid order number params qc fail
[32m      should update the status and create entry in order details[0m
    inward return with invalid order number params qc pass
[32m      should not update the status[0m
    inward return with valid order number params qc pass already in RTN INSCAN state
[32m      should not update the status[0m

Orders
  GET /orders/manifests
    get manifested order details with page and per page params as params
[32m      should get market place and shipment provider details of the manifested orders[0m

Orders
  POST /orders/rtn_in_scan
    perform rtn in scan with valid order number params
[32m      should update the status and create entry in order details[0m
    perform rtn in scan with valid tracking code params
[32m      should update the status and create entry in order details[0m
    perform rtn in scan with state less than IN TRANSIT
[32m      should not update the status[0m
    perform rtn in scan with invalid order number params
[32m      should not update the status[0m
    perform rtn in scan with invalid order number params
[32m      should not update the status[0m

Orders
  GET /orders
    existing order data
[32m      should show order details of the given order id[0m
    get existing order data with invalid order number
[32m      should not get any order details[0m

Orders
  POST /orders/update_due_time
    update order due time with proper params and order state
[32m      should update due time[0m
    update order due time with wrong status
[32m      should not update due time[0m
    update order due time with invalid order number
[32m      should not update due time[0m
    update order due time with user with different market place
[32m      should not update due time[0m

Orders
  POST /orders/update_order_line_items
    update order line items with valid params
[32m      should update the order with proper order line items[0m
    update order line items with invalid order number
[32m      should not update the order with proper order line items[0m
    update order line items with user with no market place
[32m      should not update the order with proper order line items[0m
    update order line items with invalid status
[32m      should not update the order with proper order line items[0m
    update order line items with invalid line items
[32m      should not update the order with proper order line items[0m

Orders
  POST /orders/update_status
    update order status
[32m      should update the status and create entry in order details[0m
    update order status with ready for hotc state
[32m      should update the status and create entry in order details[0m
    update order status with invalid order number
[32m      should not update the status and no entry in order details[0m

Orders
  POST /orders/update_out_scan_status
    update out scan status with valid order number params
[32m      should update the status and create entry in order details[0m
    update out scan status with invalid order number params
[32m      should not update the status and create entry in order details[0m
    update out scan status with valid order number params but no manifest
[32m      should not update the status and create entry in order details[0m

Package
  POST packages/bin_in_scan
    bin_in_scan group packages success (salable bin)
[32m      is expected to respond with numeric status code 200[0m
    bin_in_scan group packages success (rejected bin)
[32m      is expected to respond with numeric status code 200[0m
    bin_in_scan package not found
[32m      is expected to respond with numeric status code 200[0m
    bin_in_scan bin not active
[32m      is expected to respond with numeric status code 200[0m
    bin_in_scan failure Package belongs to different warehouse
[32m      is expected to respond with numeric status code 200[0m
    bin_in_scan success (hold bins)
[32m      is expected to respond with numeric status code 200[0m

Package
  POST packages/bin_in_scan
    failure cases
[32m      is expected to eq false[0m

packages_controller
  POST     /packages/close_packages
    close packages in status - created
[32m      will close packages[0m
    close packages - blank input
[32m      will return error response[0m
    close invalid packages - packages in created status
[32m      will return error response[0m

Package#get_qc_failed_packages
  List qc failed packages grouped by warehouse and supplier
[32m    is expected to eq 4[0m

packages_controller
  GET      /packages/get_variant_info
    get variant associated with package in IN_BIN status
[32m      will return variant_sku_code & uvid[0m
    get variant - non existing package
[32m      will return error response[0m
    get variant - invalid warehouse_id
[32m      will return error response[0m
    get variant - invalid package - package in status other than in_bin
[32m      will return error response[0m

packages_controller
  GET      /packages
    get purchase orders list without status filter
[32m      will display purchase orders[0m
    get purchase orders list with status filter
[32m      will display purchase orders[0m

Package
  POST packages/order_assign
    Simplified warehouse (package qty)
[32m      should split packages and assign properly[0m

packages_controller
  GET      /packages/recent_inscan_data
    get recent_inscan_data fro newly created packages
[32m      will return package details[0m

packages_controller
  POST     /packages/reset_bin_for_package
    success case
[32m      is expected to eq 9[0m
[32m      is expected to eq 0[0m
    failure case
[32m      is expected to eq "package is not in bin"[0m

packages_controller
  POST     /packages/update_missing_packages_bulk
    update in_bin packages as missing
[32m      will udpate the package status as missing[0m
    update in_bin packages as missing for non-exisiting package
[32m      will return error response[0m

PickLists::CreateManualPickList
  POST /pick_lists/create_manual_pick_list
    pick list creation without variant
[32m      should not create pick list[0m
    pick list creation without stock
[32m      should not create pick list[0m
    pick list creation without warehouse
[32m      should not create pick list[0m
    pick list creation with qc pass bin
[32m      should create pick list[0m
    pick list creation with qc fail bin
[32m      should create pick list[0m

PickLists::CreateSkuPickList
  GET /pick_lists/create_sku_pick_list
    pick list creation without sku data
[32m      should not create pick list[0m
    pick list creation with invalid bin type
[32m      should not create pick list[0m
    pick list creation with AUTO pick list type
[32m      should not create pick list[0m
    pick list creation without variant
[32m      should not create pick list[0m
    pick list creation with rejected bin and qc fail bin
[32m      should create pick list[0m
    pick list creation with unicorn account and qc fail bin
[32m      should create pick list[0m
    pick list creation with qc pass bin
[32m      should create pick list[0m
    pick list creation with qc pass bin and max pick list items count
[32m      should not create pick list[0m
    pick list creation with qc pass bin and max pick list count
[32m      should not create pick list[0m
    pick list creation with unicorn account and free bin
[32m      should create pick list[0m
    pick list creation without agent for UDH warehouse
[32m      should not create pick list[0m
    pick list creation without mp for mws warehouses
[32m      should not create pick list[0m

PickLists::Create
  POST /pick_lists
[32m    should not create picklist when stock audit in due[0m
    Empty order data for picklist creation
[32m      pick list is created with empty picklist[0m
    Empty params for picklist creation
[32m      pick list is not created[0m
    Picklist creation(SINGLE ORDER) without bin detail
[32m      it should return error when bin detail not given[0m
    Picklist creation(SINGLE ORDER) with bin detail
[32m      it should create picklist when bin detail is given[0m
    Picklist creation(SINGLE ORDER) with bin detail and enable_bin_sorting_on_expiry_time
[32m      it should create pick list when bin detail is given[0m
    Picklist creation(SINGLE ORDER) with bin detail and enable_bin_sorting_on_wh_wise
[32m      it should create picklist when bin detail is given[0m
    Picklist creation(MULTIPLE ORDERS) without bin detail
[32m      it should return error when bin detail is not given[0m
    Picklist creation(MULTIPLE ORDERS) with bin detail
[32m      it should create when bin detail is given[0m
    Picklist creation(MULTIPLE ORDERS) with bin detail and enable_bin_sorting_on_expiry_time
[32m      it should create when bin detail is given[0m
    Picklist creation(MULTIPLE ORDERS) with bin detail and enable_bin_sorting_on_wh_wise
[32m      it should create when bin detail is given[0m

PickLists::GetManualPickListReasons
  GET /pick_lists/get_manual_pick_list_reasons
    get manual pick list reasons with default value
[32m      validates default values are not coming when app preference is given[0m
    get manual pick list reasons from app preference
[32m      validates values given in app preference are not coming[0m

PickLists::GetPickListOrdersData
  GET /pick_lists/get_pick_list_orders_data
    pick list order data
[32m      should give order data[0m
    pick list order data showing based on status
[32m      should give data[0m
[32m      should give empty data[0m

PickLists::GetPickListStatus
  GET /pick_lists/get_pick_list_status
    pick list status is showing or not
[32m      it should give pick list status[0m

PickLists::Index
  GET /pick_lists
    pick lists success
[32m      validates last picklist coming as first when given without any filter[0m
    pick lists with cross dock id filter
[32m      validates cross dock id is coming in picklist[0m
    pick lists with status filter
[32m      validates status is coming in picklist[0m
    pick lists with date filter
[32m      validates created_at is coming in picklist[0m

PickList::Outward
  #Multi Quantity Packages
    #when picklist item quantity less than a package quantity
[32m      creates child package and outwards child package[0m
    When pick_list is not present
[32m      should return error message[0m

PickLists::PendingItems
  GET /pick_lists/id/pending_items
    pending items failure when picklist is not there
[32m      Throws error message when picklist is not created[0m
    pending items failure when picklist in certain state
[32m      Throws error message when picklist is not in out for pickup or closed state[0m
    pending items success when picklist is in out for pickup state
[32m      Should give response when picklist is in out for pickup state[0m
    pending items success when picklist is in closed state
[32m      should give response when picklist is in closed state[0m

PickLists::PickListDataForReturn
  GET /pick_lists/pick_list_data_for_return
    pick list data for return for empty picklist
[32m      should return error message[0m
    pick list data for return for created picklist
[32m      should return error message[0m
    pick list data for return for created picklist
[32m      should give pick list data[0m
    pick list data for return for created picklist and associated orders
[32m      should give zero package qty[0m
    pick list data for return for created picklist
[32m      should return error message[0m

PickLists::PickListTemplate
  GET /pick_lists/pick_list_template
    checking pick list template
[32m      should give correct template[0m

PickLists::Shows
  GET /pick_lists/shows
    show pick list
[32m      show pick list data[0m

PickLists::UpdatePicklistAgents
  POST /pick_lists/update_picklist_agents
    update picklist agent with picklist id
[32m      validates pickup agent is assigned when picklist id is given[0m
    update picklist agent without picklist id
[32m      validates pickup agent is not assigned when picklist id is not given[0m

PickupAgents::Index
  GET /pickup_agents/
    when warehouse_id is passed
[32m      is expected to respond with numeric status code 200[0m
    when warehouse_id is not passed
[32m      is expected to respond with numeric status code 200[0m

PurchaseOrder
  POST /purchase_orders/:id/close_purchase_order
    close valid purchase order
[32m      success response will be returned; purchase order will be moved to closed status[0m
    close invalid purchase order
[32m      response message will be obtained; purchase order will remain in same state[0m
    closed non-existing purchase order
[32m      response message will be obtained[0m

PurchaseOrder
  POST /purchase_orders/create_bulk
    With valid data
[32m      should create purchase_order[0m
    when lifting price is less than CMT LP and greater than the minimum configured limit
[32m      should create purchase_order[0m
    when lifting price is greater than CMT LP and less than the maximum configured limit
[32m      should create PO[0m
    when lifting price is equal to CMT LP
[32m      should create PO[0m
    when lifting price is less than configured limit
[32m      should return error[0m
    when lifting price is beyond the configured limit
[32m      should return error[0m
    when lifting price is equal to minimum configured limit
[32m      should create PO[0m
    when lifting price is equal to maximum configured limit
[32m      should create PO[0m
    when lifting price validation fails for one line item
[32m      should return error[0m

PurchaseOrder#create_qc_po
  while creating PO for qc passed
[32m    should be created[0m
  while creating forward PO with OPO already created
[32m    should be created[0m
  while creating forward PO with OPO already created
[32m    should be created[0m
  while creating forward PO with OPO creation
[32m    should be created[0m
  while creating PO for cancelled items
[32m    should be created[0m
  lifting price validation
    while lifting price is less than configured limit
[32m      should return error[0m
    while lifting price is beyond the configured limit
[32m      should return error[0m
    while lifting price is less than CMT price and greater than the minimum configured limit
[32m      should create PO[0m
    while lifting price is greater than CMT price and less than the maximum configured limit
[32m      should create PO[0m
    while lifting price is equal to CMT price
[32m      should create PO[0m
    while lifting price is equal to minimum configured limit
[32m      should create PO[0m
    while lifting price is equal to maximum configured limit
[32m      should create PO[0m
    when PO has multiple line items and lifting price validation fails for one line item
[32m      should return error[0m

PurchaseOrder
  POST /purchase_orders
    does not create a purchase_order (ordered quantity zero)
[32m      creates a purchase_order[0m
    creates a purchase_order
[32m      creates a purchase_order[0m
    creates a purchase_order and OPO
[32m      creates a purchase_order[0m
    creates a purchase_order with return po
[32m      creates a purchase_order[0m
    creates a purchase_order with return po (udh warehouse, chalan not required)
[32m      creates a purchase_order[0m
    when create grn param is passed (udh) and no bin is present
[32m      should create po and not grn (forward po)[0m
[32m      should create po and not grn (return po)[0m
    when bins are present but packages assignable is zero or low (udh)
[32m      should not create po[0m
[32m      should not create po (return po)[0m
    when create grn param is passed (udh) and  bins are present
[32m      should create grn and po[0m
[32m      should create grn and po for damage return[0m
      invalid po type
[32m        should not create purchase_order[0m
      valid po type
[32m        should create purchase_order[0m
      When No line items are given
[32m        should create purchase_order[0m
      When No Warehouse is selected
[32m        should create purchase_order[0m
      PO chalan
        when po chalan is not given for udh po
[32m          should throw error[0m
        when po_chalan is passed
[32m          should create PO[0m
        Free PO
[32m          should create PO[0m
    lifting price validation
      when lifting price is less than configured limit
[32m        should throw error[0m
      when lifting price is beyond the configured limit
[32m        should throw error[0m
      when lifting price is less than CMT price and greater than the minimum configured limit
[32m        should create PO[0m
      when lifting price is greater than CMT price and less than the maximum configured limit
[32m        should create PO[0m
      when lifting price is equal to CMT lifting price
[32m        should create PO[0m
      when lifting price is equal to minimum configured limit
[32m        should create PO[0m
      when lifting price is equal to maximum configured limit
[32m        should create PO[0m
      when PO has multiple line items and lifting price validation fails for one line item
[32m        should return error[0m

PurchaseOrder
  GET     /purchase_orders/download_grn_challan
    When PO is not found
[32m      is expected to eq "PO not found"[0m
    When po is found
[32m      is expected to eq "No challans uploaded"[0m

PurchaseOrder
  GET /purchase_orders
    Listing purchase orders
[32m      should return POs with associated data[0m
    Listing purchase orders (udh warehouse)
[32m      should return POs with associated data and chalan url[0m
    purchase_order success with seller user_id filter
[32m      is expected to respond with numeric status code 200[0m
    While applying po_id and supplier_id filter
[32m      should return PO with associated data[0m
    verify grn filter and pagination
[32m      will return 2 purchase_orders having reconciled grns in desc order[0m
    with rto params
[32m      will not return warehouse & supplier details[0m

PurchaseOrder
  POST     /purchase_orders/qc_scan
    move package from created to qc_scanned state
[32m      package will be moved to status 30[0m
    choose invalid qc status - created
[32m      will retrun error response, status of package will remain unchanged[0m
    move package from created to qc_scanned state - invalid variant_id
[32m      will return error response, status of package will remain unchanged[0m
    move package from qc_scanned state
[32m      status of package will remain unchanged[0m
    move package from created to qc_scanned state - identify using reference number
[32m      package will be moved to status 30[0m
    move group package from created to qc_scanned state
[32m      packages associated with group package will be moved to status 30[0m
    move invalid group package from created to qc_scanned state
[32m      error message will be obatied[0m

PurchaseOrder#return_packages_po
[32m  is expected to eq 4[0m

PurchaseOrder#Show
[32m  show return PO details and associated data[0m

PurchaseOrder
  POST     /purchase_orders/update_price
    verify edit unit price of line item without blank price
[32m      will not edit price[0m

Seller
  POST /sellers/migrate_seller
    not able to fetch seller data
[32m      should throw error[0m
    When seller already present
[32m      should throw error[0m
    when seller is not present (create supplier app preference is true)
[32m      should create seller[0m
    when seller is not present (create supplier app preference is false)
[32m      should create seller[0m

GET /sellers/get_warehouse_sellers_list
  create warehouse and get seller's user ids
[32m    should return seller's user ids[0m

Suppliers#add_seller_to_supplier
  When creating new supplier seller mapping
[32m    should be created[0m
  When creating duplicate supplier seller mapping
[32m    should not be created[0m

Suppliers#address_details
  List address details
[32m    should return address details[0m

Suppliers#create_address
  Create Supplier Address
[32m    should be created[0m

Suppliers#Create
  Create supplier
[32m    should call ss2 for supplier creation[0m

Suppliers#Index
  List suppliers
[32m    should return supplier details[0m
  When filters applied
[32m    should return supplier details[0m

Suppliers#ListWarehouses
  Supplier has warehouse_supplier_mappings
    type_id param is passed
[32m      should return warehouses mapped with the supplier and of given type[0m
    type_id param is not passed
[32m      should return warehouses mapped with the supplier[0m
    sub_bu param is passed
[32m      should return warehouses mapped with the supplier and of given type and Sub BU[0m
    sub_bu param is not passed
[32m      should return warehouses mapped with the Sub BU[0m
  Supplier doesn't has warehouse_supplier_mappings
[32m    should return false response[0m

Suppliers#List
  List suppliers
[32m    should return supplier details[0m
[32m    should return supplier details (name filter)[0m

Suppliers#update_supplier_seller_mapping
  When updating supplier seller mapping
[32m    should replace mapping[0m

TransferOrders
  Print Challan
[32m    should give 200 response[0m

TransferOrders#create_bulk
  When valid params are given
[32m    Should create to and corresponding po[0m
  When valid params are given with destination variant id
[32m    Should create to and corresponding po[0m
  When different source and destination_variant given with transfer_type as normal
[32m    Should create to and corresponding po[0m
  When missing skus are given
[32m    Should return proper error msg[0m
  When Destination warehouse is not a MWS
[32m    Should only create TO[0m
  When PO validation fails
[32m    Should rollback and to record should not be created[0m
  When unit_price is given
[32m    Should create to and corresponding po[0m
  When Seller id is given
[32m    Should create to and corresponding po[0m
  when empty file is given
[32m    should not create TO[0m
  Baki Credit Restriction
    When TO amount is greater than baki limit
[32m      Should not create to and corresponding po[0m
    When Baki Restriction is disabled
[32m      Should not create to and corresponding po[0m
    When Baki api response contains error
[32m      Should not create to and corresponding po[0m
    When Baki api response contains invalid keys
[32m      Should not create to and corresponding po[0m

TransferOrders
  POST create_pick_list
    When pick_list is already present
[32m      is expected to include "Pick List creation failed PickList already created"[0m
    When valid params are passed
[32m      Should create pick_list[0m
    When available qty is lower than the given quantity
[32m      Should create pick_list[0m
    When transfer order is not found
[32m      Should create pick_list[0m
    When transfer order is not found
[32m      Should create pick_list[0m
    When transfer order is invalid state
[32m      Should create pick_list[0m

TransferOrders#Create
  When valid params are given
[32m    Should create to and corresponding po[0m
  When valid params are given with destination variant id
[32m    Should create to and corresponding po[0m
  when invalid params are passed
[32m    should return error msg[0m
  When PO validation fails
[32m    Should rollback and to record should not be created[0m
  When stock not available
[32m    Should return error[0m
  When destination warehouse is not present
[32m    Should return proper error message[0m
  When TO is created from MWS to FFC
[32m    Should return proper error message[0m
  Baki Credit Restriction
    When TO amount is greater than baki limit
[32m      Should not create to[0m
    When Baki Restriction is disabled
[32m      Should create to[0m
    When baki api returns error
[32m      Should not create to[0m
    When baki api returns invalid key
[32m      Should not create to[0m

TransferOrder
  GET /transfer_orders/get_transfer_order_template
    checking pick list template
[32m      should give correct template[0m

TransferOrders
  GET index
[32m    should return to list[0m

TransferOrders
  POST /transfer_order/order_sent
    When pick_list is not in closed state
[32m      should return proper error msg[0m
    When the transfer_order is in invalid state
[32m      should return proper error msg[0m
    When the transfer_order not found
[32m      should return proper error msg[0m
    When the transfer_order is in valid state and the pick_list is closed
[32m      should update state[0m

GrnsController
  POST     /udh/grns
    create vaild grn
[32m      grn and grn items will be created[0m
    provide blank grn_creation_data
[32m      will return error message[0m
    provide invalid purchase order id
[32m      will return error message[0m
    crete grn for purchase order in invalid state
[32m      will return error message[0m
    crete grn with received quantity as 0
[32m      will return error message[0m

WarehouseConfigsController
  POST /udh/warehouse_configs
    invalid warehouse
[32m      should return error[0m
    new config
[32m      should return proper configs[0m
    updating exsisting config
[32m      should return proper configs[0m

PickListLockConfigsController
  GET /udh/warehouse_configs
    only one warehouse has the config
[32m      should return default value for warehouse without lock config[0m
    warehouse_id filter
[32m      should return proper configs[0m
    warehouse_name filter
[32m      should return proper configs[0m
    sub_bu filter
[32m      should return proper configs[0m
    active filter
      active == 1
[32m        should return proper configs[0m
      active == 0
[32m        should return proper configs[0m

FulfilmentCenter::Index
  GET /api/v2/fulfilment_centers/
    Index response
[32m      is expected to equal 1[0m

Grn
  POST V2 create grn
    Success Case
[32m      is expected to eq "\xFF\xD8\xFF\xE0\u0000\u0010JFIF\u0000\u0001\u0001\u0001\u0000H\u0000H\u0000\u0000\xFF\xDB\u0000C\u0...\xFE\u000E?\x83\x8F\xE0\xE3\xF88X\xAF\xF8\u007FQª 3\xB0V.\xA0\x87A\x8D\xB4\xB7W\xE1%o\xF7e+\xFF\xD9"[0m
    when po_type is configured
[32m      is expected to eq 2[0m
    failure case
[32m      should return error when po is not present[0m
[32m      should return error when po is in invalid state[0m
[32m      should return error when grn creation fails (bin not present)[0m
[32m      should return error when grn creation fails (when received qty is not valid)[0m
[32m      should return error when source to is not closed[0m

Grn
  POST V2 grns
    create grn success (po source type present)
[32m      is expected to eq "\xFF\xD8\xFF\xE0\u0000\u0010JFIF\u0000\u0001\u0001\u0001\u0000H\u0000H\u0000\u0000\xFF\xDB\u0000C\u0...\xFE\u000E?\x83\x8F\xE0\xE3\xF88X\xAF\xF8\u007FQª 3\xB0V.\xA0\x87A\x8D\xB4\xB7W\xE1%o\xF7e+\xFF\xD9"[0m
    create grn failure--> PO not found
[32m      is expected to eq nil[0m
    create grn failure--> Corresponding TO is invalid state
[32m      is expected to eq nil[0m
    create grn failure
[32m      is expected to eq nil[0m
    create grn success
[32m      is expected to eq "image/jpeg"[0m
    create grn failure  (cloud obj fetch fails)
[32m      is expected to include "Failed to set Challan data"[0m
    create grn failure  (cloud obj deletion fails)
[32m      is expected to eq "image/jpeg"[0m

GetGrnChallanUploadUrl
  GetGrnChallanUploadUrl
    Grn Challan
[32m      should return file_url[0m
[32m      should return error on invalid extentsion[0m

Orders::CreateMwsDeliveredOrders
  POST /api/v2/orders/create_mws_delivered_orders
    without market place user
[32m      Should give unauthorised response[0m
    without order data and Pickup Agent data
[32m      Should give Invalid Order Data and Pickup Agent not Found response[0m
    Without Order Type and Order Status
[32m      Should give Invalid Order Type and Invalid Order Status response[0m
    With Invalid Order Status
[32m      Should give Invalid Order Type and Invalid Order Status response[0m
    With Invalid Order Type
[32m      Should give Invalid Order Type and Invalid Order Status response[0m
    With aleady existing order number data
[32m      Should give Order created already response[0m
    With Invalid Line Items data
[32m      Should give Line Items not Found response[0m
    With Invalid sku data
[32m      Should give Variant not found response[0m
    With Invalid Warehouse data
[32m      Should give Warehouse is not found response[0m
    Without Valid order data
[32m      Should give order creation failed response[0m
    Without Valid Pick Lists data
[32m      Should give Valid Pick Lists Not found response[0m
    Without Valid Pick List Items data
[32m      Should give Valid Pick List Items Not found response[0m
    With Valid Data
[32m      Should give package quantity equal to line item quantity[0m

Orders::GetOrderDetails
  with invalid order number
[32m    should return error[0m
  with valid order number
[32m    should return data[0m

Orders::ManifestOrders
  with invalid order number
[32m    return order[0m

Package
  POST /api/v2/packages/bulk_status_updation
    When invalid params are given
[32m      Should return error[0m
    When valid params are given
[32m      Should return proper message[0m
    Partial update
[32m      Should return proper message and error msg[0m

PickLists
  GET api/v2/pick_lists/dispatch_to_partner
    When params are valid
[32m      should create pick list[0m
    When params are invalid (max_pick_list_item_count validation)
[32m      should not create pick list[0m
    When pickup_agent is not present
[32m      should not create pick list[0m

PickLists
  GET api/v2/pick_lists/get_pick_list_details
    When record is present
[32m      is expected to eq 3[0m
    When record is not present
[32m      is expected to include "Record not found"[0m
    When pick_list state is returned
[32m      is expected to eq 2[0m

PickLists
  GET api/v2/pick_lists.json
    When record is present
[32m      is expected to eq 3[0m
    When record is not present
[32m      is expected to include "data not found"[0m
    When pickup_agent filter is passed
[32m      is expected to eq 3[0m
    When status filter is passed
[32m      is expected to eq 1[0m
    When date filter is passed
[32m      is expected to eq 3[0m
    When type filter is passed
[32m      is expected to eq 3[0m

PickLists
  GET api/v2/pick_lists/prepopulate
    When No open orders are present
[32m      Should return proper message[0m
    When open orders are present and wms has respective data
[32m      Should return proper message and data[0m
    When open orders are present and wms has no respective data
[32m      Should return proper message and data[0m
    When open orders are present and wms has no respective data(partial)
[32m      Should return proper message and data[0m
    When oms api fails
[32m      should return error msg[0m
    When prepopulate api is disabled
[32m      is expected to include "Failed to Fetch Order Data"[0m

PickupAgents::DeactivatePickupAgent
  POST /api/v2/pickup_agents/deactivate_pickup_agent
    When PickupAgent has no pending items
[32m      should make the agent as inactive[0m
    When PickupAgent has open pick_list
[32m      is expected to eq true[0m
    When PickupAgent has open orders
[32m      is expected to eq true[0m
    When PickupAgent has no pending items and does not belong to mws
[32m      should make the agent as inactive[0m
    when PickupAgent has raised return request
[32m      is expected to eq true[0m
    when PickupAgent has some items that are valid for return (closed picklists but not yet delivered i.e for which he/she has not got any orders)
[32m      is expected to eq true[0m

PickupAgents::GetDeliverableItemsData
  GET /api/v2/pickup_agents/get_deliverable_items_data
    without pickup agent data
[32m      Should give pickup agent not found response[0m
    without market place user
[32m      Should give pickup agent not found response[0m
    with valid data
[32m      Should give Valid response[0m

PickupAgents::GetWarehouseInfo
  POST /api/v2/pickup_agents/get_warehouse_info
    When PickupAgent data is present
[32m      is expected to eq 1587[0m
    When PickupAgent data is not present
[32m      is expected to eq "MWS not found"[0m

PickupAgents::Index
  GET /api/v2/pickup_agents/
    When PickupAgent data is present
[32m      is expected to be present[0m
    When PickupAgent data is not present
[32m      is expected to eq [][0m
    When Show open orders param is passed
[32m      is expected to eq {"id"=>88, "name"=>"Ms. Debbie Emard", "oldest_open_order_date"=>"2022-11-04", "open_items_count"=>5,...rders_count"=>5, "phone"=>"8801242732075", "return_items"=>0, "user_id"=>6016, "warehouse_id"=>1595}[0m

PickupAgents::PickListItemsData
  GET /api/v2/pickup_agents/pick_list_items_data
    without pickup agent data
[32m      Should give pickup agent not found response[0m
    pickup agent id without status
[32m      Should give Invalid Status response[0m
    pickup agent user id without status
[32m      Should give Invalid Status response[0m
    pickup agent phone without status
[32m      Should give Invalid Status response[0m
    valid pickup_pending status without picklists
[32m      Should give Empty response[0m
    valid returning status without picklists
[32m      Should give Empty response[0m
    valid return_pending status without picklists
[32m      Should give Empty response[0m
    with valid data
      with pickup_pending status filter
[32m        Should give picklist response[0m
      with end_date filter
[32m        should return corresponding picklists only[0m
      with return_pending and returning status filter
[32m        should return corresponding picklists only[0m
      while fetching only count
[32m        Should return only count, without item data[0m

PickupAgents::ReturnProducts
  POST /api/v2/pickup_agents/receive_products
    When invalid PickLists are passes as params
[32m      Should return proper error message[0m
    When  PickLists are passes as params
[32m      Should return Success message[0m

PickupAgents::return_inward
  #Multi Quantity Packages
    #when valid params are passed
[32m      inbins the given amount of packages[0m
    #When invalid PickList is given
[32m      Should return error msg[0m

PickupAgents::ReturnProducts
  POST /api/v2/pickup_agents/return_products
    When PickList are present
[32m      Should change the state of the given picklists[0m
    When some PickLists are missing
[32m      should return proper error message[0m
    When  PickLists are in wrong state (other than closed)
[32m      should return proper error message[0m
    When  PickLists are in wrong state (other than closed) and pickupagent user_id is passed
[32m      should return proper error message[0m
    When  PickLists are in wrong state (other than closed) and pickupagent phone is passed
[32m      should return proper error message[0m
    When  PickupAgent not found
[32m      should return proper error message[0m

PurchaseOrders
  POST api/v2/purchase_orders/approve_purchase_order
    When record is present and no corresponding TO is present
[32m      is expected to include "Purchase Order is Approved"[0m
    When record is not present
[32m      is expected to include "Purchase Order not found"[0m
    when po is in invalid state
[32m      is expected to include "Purchase Order is in"[0m
    When record is present and  corresponding TO is present
[32m      is expected to be present[0m
    When record is present and  corresponding TO is present (outward fails)
[32m      is expected to include "Purchase Order Approval failed "[0m

PurchaseOrders
  POST api/v2/purchase_orders/cancel_purchase_order
    When record is present and no corresponding TO is present
[32m      is expected to include "Purchase Order is Canceled"[0m
    When record is not present
[32m      is expected to include "Purchase Order not found"[0m
    when po is in invalid state
[32m      is expected to include "Purchase Order is in"[0m
    When record is present and no corresponding TO is present
[32m      is expected to include "Purchase Order is Canceled"[0m

PurchaseOrders
  GET api/v2/purchase_orders/get_po_details
    When record is present
[32m      is expected to eq 20[0m
    When record is not present
[32m      is expected to include "Record not found"[0m

PurchaseOrders
  GET api/v2/purchase_orders/
    When warehouse_id is passed
[32m      should return purchase orders of that warehouse[0m
    When status param is passed
[32m      is expected to eq false[0m
    When status param is passed with PO pending days restriction fasle
[32m      is expected to eq true[0m
    When no warehouse is passed
[32m      should take current warehouse[0m
    When no record is found
[32m      should return empty response[0m

TransferOrders
  PUT api/v2/transfer_orders/:id/cancel_transfer_order
    when TO is not present
[32m      is expected to include "Transfer order can't be blank"[0m
    when the user is not a admin and the to is more than a day old
[32m      is expected to include "Not permitted to cancel"[0m
    when destination po is already received
[32m      is expected to include "Destination warehouse has already received the products"[0m
    Success case
[32m      is expected to include "TO being processed please try once its closed"[0m
    PickList created but not yet outwarded
[32m      should close the pick_list[0m
    PickList created and outwarded
[32m      is expected to eq 20[0m

TransferOrders
  GET api/v2/transfer_orders/get_to_details
    When To is present
[32m      is expected to include "Transfer Order Found"[0m
    when TO is not present
[32m      is expected to eq {}[0m

TransferOrders
  GET api/v2/transfer_orders/
    When destination warehouse id is passed
[32m      is expected to eq 3[0m
    when status param is passed
[32m      is expected to eq false[0m
    when status param is passed with TO pending days restriction false
[32m      is expected to eq true[0m
    When TO type is passed
[32m      is expected to eq 3[0m

Variants
  GET api/v2/variants/get_inventory
    default condition
[32m      should return variants[0m
    when supplier filter enabled and seller id is given
[32m      should return variants[0m
    when bin type is qc_fail
[32m      should return variants[0m
    when bin type is missing
[32m      should return variants[0m
    when sku_code filter is given
[32m      should return variants[0m
    when notes filter is given
[32m      should return variants[0m
    when upc_code filter is given
[32m      should return variants[0m
    when No data is present
[32m      should return empty result[0m
    When available_stock param is passed
[32m      Should return orders_assignable value[0m
    when supplier filter enabled and warehouse is of type MWS or FFC
[32m      should return variants(supplier filter should not work)[0m
    when current_warehouse is not set
[32m      should return empty response[0m

Variants
  GET api/v2/variants/search_variants
    default condition
[32m      should return variants with pagination[0m
[32m      should return variants w/o passing warehouse id[0m
[32m      should return variants with stock available only[0m
    should search by notes
[32m      should return variants[0m
    should search by sku_code
[32m      should return variants[0m
    should not search by invalid value
[32m      should return empty result[0m
    pick list restriction enabled but config not created
[32m      should return only one item which is match in the pick list items[0m
    pick list restriction enabled
[32m      should return only one item which is match in the pick list items[0m
    pick list restriction enabled
[32m      should return error message[0m
    pick list restriction enabled
[32m      should return empty response as no pick list created for this date[0m

WholesaleShop::Create
  POST /api/v2/wholesale_shops
    Create response
[32m      is expected to eq "Created Successfuly"[0m
    Create response - Failure
[32m      is expected to eq "Code is already present"[0m

WholesaleShop::Index
  GET /api/v2/wholesale_shops/
    Index response
[32m      is expected to equal 1[0m
    Index response - With Term
[32m      is expected to equal 0[0m
    Index response - With FFC
[32m      is expected to equal 0[0m
    Index response - With Sort Data
[32m      is expected to equal 1[0m
    when basic data params is passed
[32m      is expected to contain exactly "id", "code", "status", "phone", "ffc_name", and "ffc_id"[0m

WholesaleShop::Show
  GET /api/v2/wholesale_shops/:id
    Show response
[32m      is expected to be present[0m

WholesaleShop::Update
  PUT /api/v2/wholesale_shops/:id
    Update response
[32m      is expected to eq "Updated Successfuly"[0m
    Approval
      When parent is a simplified warehouse
[32m        is expected to eq "Updated Successfuly"[0m
    Update response - Failure - Code Same
[32m      is expected to eq true[0m
    Update response - Failure - No Warehouse
[32m      is expected to eq false[0m
    Update response - Failure - Junk Warehouse
[32m      is expected to eq false[0m

PickupAgentController
  Check PickList Data
    When agent id is passed
[32m      it should give pick list data[0m
    When fetch_available_qty param is passed
[32m      it should give pick list data and proper available_quantity[0m
    when phone number is passed
[32m      should not return any pick list[0m
    when phone number is passed and date param is passed
[32m      should not return any pick list[0m
    when start date is passed
[32m      it should give pick list data[0m
    when pickup agent is not present
[32m      it should give pick list data[0m
    when no pick_lists are present
[32m      should not return any pick list[0m

Variant
  GET variants/get_in_bin_details
    Variant present
[32m      should return data[0m
    variant not present
[32m      should return not found error[0m

Variant
  GET variants/get_seller_variants
    default condition
[32m      should return variants[0m
    when supplier filter enabled
[32m      should return variants[0m
    when in stock filter is applied
[32m      should return variants[0m
    when bin type is qc_fail
[32m      should return variants[0m
    when sku_code filter is given
[32m      should return variants[0m
    when notes filter is given
[32m      should return variants[0m
    when upc_code filter is given
[32m      should return variants[0m
    when hide in_active variants is disabled
[32m      should return variants[0m
    when supplier filter enabled and warehouse is of type MWS or FFC
[32m      should return all variants (should not consider supplier mappings)[0m

Variant
  GET variants/get_variant_stock_data
    get stock data with provider warehouse id success
[32m      Should return stock data[0m
    get stock data success
[32m      Should return stock data[0m
    get stock data unauthorised
[32m      Should return stock data[0m

WarehouseBin
  GET warehouse_bins/get_bin_package_details
    Success case
[32m      is expected to eq 5[0m

Warehouses
  POST /warehouses/add_pickup_agent
    add pickup agents for a warehouse
[32m      should add pickup agent and map to current warehouse[0m
    add pickup agents for a warehouse with invalid number
[32m      should not add pickup agent and map to current warehouse[0m
    add pickup agents for a warehouse (when user_id and warehouse_id is passed)
[32m      should add pickup agent and map to current warehouse[0m
    add pickup agents for a warehouse (when user_id and warehouse_id is passed)
[32m      should add pickup agent and map to current warehouse[0m
    When the agent is inactive
      when phone is passed
[32m        should add pickup_agent and reassign the warehouse id and name[0m
      when user-id is passed
[32m        should add pickup_agent and reassign the warehouse id and name[0m
      When the agent has open items
[32m        should not add pickup_agent and reassign the warehouse id and name[0m

Warehouses
  POST /warehouses/add_seller_to_wh
    add seller to warehouse
[32m      should map the seller to the warehouse[0m
    add invalid seller_id to warehouse
[32m      should not map the seller to the warehouse[0m

Warehouses
  POST /warehouses/add_suppliers
    add supplier to warehouse
[32m      should map the supplier to the warehouse[0m

Warehouses
  POST /warehouses/add_user_to_wh
    add user for a warehouse
[32m      should map user to current warehouse[0m

Warehouses
  POST /warehouses
    create a warehouse with valid params
[32m      should create a new warehouse[0m
    create a warehouse with already present warehouse code
[32m      should not create a new warehouse[0m

Warehouses
  POST /warehouses/delete_sellers
    delete seller from warehouse
[32m      should remove the seller to warehouse mapping[0m

Warehouses
  POST /warehouses/delete_suppliers
    delete supplier from warehouse
[32m      should remove the supplier to warehouse mapping[0m

Warehouses
  POST /warehouses/delete_users
    delete existing warehouse user mapping for valid user id
[32m      should delete the user maping and show success message[0m
    delete existing warehouse user mapping for valid user id who has no warehouse mapping
[32m      should show proper error[0m

Warehouses
  GET /warehouses/destination_warehouses
    When current warehouse is a FFC
[32m      Should return MWS of current warehouse(FFC) and also the ffcs[0m
    When current warehouse is a simplified warehouse
[32m      Should return MWS of current warehouse(FFC) and the ffcs and regular wms[0m
    When current warehouse is a FFC and not in app-preference
[32m      Should return MWS of current warehouse(FFC) and also the ffcs[0m
    when current warehouse is a normal warehouse
[32m      should return all warehouses[0m
    when current warehouse is not present
[32m      should return empty response[0m
    when current warehouse is an MWS
[32m      should return empty response[0m

Warehouses
  POST /warehouses/edit_pickup_agent
    update pickup agent phone data with valid pickup agent id and valid phone params with associate_cre_user_for_dsr enabled
[32m      should update the pickup agent data with appropriate data[0m
    update pickup agent phone data with valid pickup agent id and valid phone params with associate_cre_user_for_dsr disabled
[32m      should update the pickup agent data with appropriate data[0m
    update pickup agent phone data with valid pickup agent id and invalid phone params
[32m      should not update the pickup agent data with appropriate data[0m
    update pickup agent phone data with invalid pickup agent id and invalid phone params
[32m      should not update the pickup agent data with appropriate data[0m

Warehouses
  GET /warehouses/expiring_image_url
    expiring_image_url API
[32m      success case[0m
    expiring_image_url API
[32m      invalid image path[0m

Warehouses
  GET /warehouses/file_upload_url
    file_upload_url API
[32m      invalid extension[0m
[32m      success case[0m

Warehouses
  GET /warehouses/get_all_sellers
    get sellers for a warehouse
[32m      should list all sellers mapped to current warehouse[0m

Warehouses
  GET /warehouses/get_pickup_agents
    get pickup agents for a warehouse
[32m      should list all pickup agents mapped to current warehouse[0m

Warehouses
  GET /warehouses/get_sellers_list
    get seller for a warehouse
[32m      should list all sellers mapped to current warehouse[0m

Warehouses
  GET /warehouses/get_users
    get users mapped to a warehouse(normal user)
[32m      should list all users mapped to current warehouse[0m
    get users mapped to a warehouse(auth user)
[32m      should list all users mapped to current warehouse[0m
    get users mapped to a warehouse(auth user) and no warehouse user mappings
[32m      should return empty list[0m
    When identity service api call fails
[32m      Should throw proper error message[0m
    When Json Parse fails
[32m      Should return empty response[0m

Warehouses
  GET /warehouses/get_warehouse_extra_details
    get warehouse extra details by id
[32m      should give warehouses extra details of given id[0m
    get warehouse extra details - default by id
[32m      should give warehouses extra details (default small_notes_threshold) of given id[0m
    get warehouse extra details - Warehouse not present
[32m      should give warehouses empty extra detail[0m

Warehouses
  GET /warehouses/get_warehouses_list
    get existing warehouse data for a user with user email params
[32m      should show all existing warehouses[0m
    get existing warehouse data for a user with non existing user email params
[32m      should show all existing warehouses[0m

Warehouses
  GET /warehouses
    get existing warehouse data for a user
[32m      should show all existing warehouses[0m
    get existing warehouse data for user with udh_wms permission
[32m      should show only the warehouse mapped to the user[0m
    when type param is passed
[32m      should show only the warehouse of that type[0m

Warehouses
  GET /warehouses/list_warehouses
    get existing warehouse data for a user
[32m      should show all existing warehouses[0m
    get existing warehouse data for user with udh_wms permission
[32m      should show only the warehouse mapped to the user[0m
    when type param is passed
[32m      should show only the warehouse of that type[0m
    when search param is passed is passed
[32m      should show only the warehouse of that type[0m
    when search param is passed as warehouse id
[32m      should show only the warehouse of that type[0m
    when current warehouse is present and is skipped in pagination
[32m      should show only the warehouse of that type[0m

Warehouses
  GET /warehouses/reports_warehouse_list
    get existing warehouse data for a user
[32m      should show all existing warehouses[0m
    get existing warehouse data for a user
[32m      should show all existing warehouses[0m

Warehouses#StockAuditList
  list audit stock
[32m    should return success[0m
[32m    with wrong mws phone filter[0m

Warehouses#StockAuditLog
  add stock audit log
[32m    should return success[0m
[32m    should store log even if variant id not passed[0m
[32m    should return success with sku[0m
[32m    should return success submitting stock for zero system stock variant[0m
[32m    should return error for invalid variant sku[0m
[32m    should return error for invalid variant id[0m
[32m    should return error when audit period not started[0m

Warehouses#StockAuditStatus
  get stock audit log status
[32m    should return response when last stock audit not completed[0m
[32m    should return response when last stock audit completed within last week and audit log period started[0m
[32m    should return response when stock audit already completed for this week[0m
[32m    should return response when stock audit period not started yet[0m
[32m    should return response when last stock audit completed before last week[0m
  When status param is passed with MP landing page as default
[32m    should return response when last stock audit completed before last week[0m
  When status param is passed with MP landing page as PO Pending
[32m    should return response when last stock audit completed before last week[0m
  When status param is passed with MP landing page as TO Pending
[32m    should return response when last stock audit completed before last week[0m

Warehouses#StockAuditList
  audit stock summary
[32m    should return success[0m
[32m    should return empty response[0m

Warehouses#Suppliers
  List suppliers
[32m    is expected to eq "(955) 160-6925 x09680"[0m

Warehouses
  POST /warehouses/sync_orders_to_wms
    When seller id is given
[32m      should trigger sync for given seller_id for mapped marketplaces[0m
    When warehouse id is given
[32m      should trigger sync for given warehouse_id for all marketplaces[0m

Warehouses
  POST /warehouses/update_bin_capacity
    update warehouse data with valid warehouse id and valid capacity params
[32m      should update the warehouse with appropriate data[0m
    update warehouse data with valid warehouse id and negative capacity
[32m      should not update the warehouse bin capacity[0m

Warehouses
  POST /warehouses/update_extra_details
    warehouse exists
[32m      returns successful message[0m
    warehouse does not exist
[32m      returns error message[0m

Warehouses
  PUT /warehouses
    update warehouse data with valid warehouse id and warehouse data params
[32m      should update the warehouse with appropriate data[0m

Warehouses
  GET /warehouses/user_warehouses
    get list of warehouses which user have access to
[32m      should show only the warehouses mapped to the user with warehouse type filter[0m
    get list of warehouses which user have access to
[32m      should show only the warehouses mapped to the user with warehouse type filter[0m
    get list of warehouses which user have access to
[32m      should show only the warehouses mapped to the user with warehouse type filter[0m
    get list of warehouses which user have access to
[32m      should show only the warehouses mapped to the user with warehouse type filter[0m

Warehouses::warehouse_bins_upload_template
  GET /warehouses/warehouse_bins_upload_template
    Bin upload template
[32m      is expected to respond with numeric status code 200[0m
    Bin upload template
[32m      is expected to respond with numeric status code 200[0m

Warehouses
  GET /warehouses/warehouse_by_ids
    get warehouse data by ids
[32m      should show warehouses names of given ids[0m
    get warehouse data by ids with address data
[32m      should show warehouses names of given ids[0m

Warehouses
  GET /warehouses/warehouse_names
    get existing warehouse data
[32m      should show all existing warehouses names[0m

AccountMigrationService
  account_migration_service
    Success case
[32m      example at ./spec/services/account_migration_service_spec.rb:30[0m

Grns::CreateService
  normal package grn create service
[32m    Creates grn with normal packages[0m
  Group Package package grn create service
[32m    Creates grn with group packages[0m
  Group Package grn create sevice error per package qty > 1
[32m    Creates grn with group packages[0m
  wrong po status
[32m    grn creation should fail[0m
  when OPO payment is not completed
[32m    grn creation should be failed[0m
  when OPO payment is completed
[32m    grn should be created[0m
  when wh is skipped
[32m    grn should be created[0m

Grns::InbinService
  #packages inbin service
[32m    creates packages with inbin status[0m
  #packages inbin service
[32m    should skip if packages are already created[0m
  #group package inbin service
[32m    creates group package & packages with inbin status[0m
  #group package inbin service
[32m    should skip if group_package is already created[0m
  #group package inbin service
[32m    should skip if group_package is already created[0m
  #packages inbin service with more than one bin
[32m    returns errors[0m
  #packages inbin service allowed only for unicorn
[32m    returns allowed only for unicorn error[0m
  Free bin not present
[32m    returns allowed only for unicorn error[0m

Grns::CreateService
  When Complete Grn Item data present
    Single source supplier po
      Full Grn
[32m        Creates grn and grn_items[0m
      Partial GRN
[32m        Creates grn and grn_items[0m
    Multiple source supplier po
      Full Grn
[32m        Creates grn and grn_items[0m
      Partial Grn
[32m        Creates grn and grn_items[0m

Packages::BinOutScanService
  Failure cases
    When the packages belongs to different group package
[32m      is expected to include "Package doesn't belongs to pick_list"[0m
    When the qc status is invalid
[32m      is expected to include "QC status is not valid"[0m
    when the pick list is in invalid state
[32m      is expected to include "Pick List is in created state"[0m
    when the package is in invalid state
[32m      is expected to include "Package is in"[0m
  Success case
    when all line items are picked
[32m      should close the picklist[0m
    when pick_list is of type single or multiple orders
[32m      should auto assign line item[0m
    when package qty is greater than to pli unpicked_qty
[32m      should auto assign line item[0m

Packages::BulkStatusUpdationService
  #When invalid action is given
[32m    should return error[0m
  #When invalid data is given
[32m    should return error[0m
  #When bin is not present
[32m    should return error[0m
  #When Variant is not present
[32m    should return error[0m
  #Qc fail sku
[32m    move the packages to failed bin[0m
  #Qc pass sku
[32m    move the packages to salable bin[0m
  #Qc fail sku / vwm already present
[32m    move the packages to rejected bin[0m
  #Mark as missing
[32m    move the packages to missing state[0m
  Multiple Variants qc_fail
[32m    move the packages to failed bin[0m
  Multiple Variants qc pass
[32m    Should move packages to salable bin and return proper success message[0m
  When bin capacity update fails
[32m    Should return error and rollback[0m

Packages::CreateChildService
  #child package creation for new package
[32m    creates child package[0m
  #child package creation for inbin package
[32m    creates child package and copies parent package details[0m
  #when nil quantity is passed
[32m    returns errors[0m
  #when 0 quantity is passed
[32m    returns errors[0m
  #when parent package has 1 qty
[32m    returns errors[0m
  #when quantity is greater than existing package
[32m    returns errors[0m

PicklistItems::MultiQcFailItemsCreateService
  #Multi Quantity Package
    picklist items for qc failed packages from single bin
[32m      creates qc failed picklist[0m
    picklist items for qc failed packages from multiple bins
[32m      creates qc failed picklist[0m
    when picklist items quantity is greater than available qc failed packages from multiple bins
[32m      creates qc failed picklist[0m
  #Single Quantity Package
    picklist items for qc failed rejected bin
[32m      returns picklist items with qcfailed bin[0m
  nil check
[32m    returns errors[0m

Picklists::AutoCreateService
  auto picklist creation for single order picklist
[32m    creates single order picklists[0m
  auto picklist creation for MULTIPLE_ORDERS picklist
[32m    creates MULTIPLE_ORDERS picklists[0m
  when item limit reached
[32m    creates multi picklists based on item limit[0m
  when order limit reached
[32m    creates multi picklists based on order limit[0m
  when cross dock nil or disabled
[32m    creates picklists warehouse wise[0m
  with & without crossdock
[32m    creates picklists crossdock wise[0m

Picklists::BulkOutwardService
  #Multi Quantity Packages
    #when picklist item quantity less than a package quantity
[32m      creates child package and outwards child package[0m
    #when picklist item quantity is equal to package quantity
[32m      outwards packages[0m
    #when picklist item quantity is greater than package quantity
[32m      splits and outwards packages[0m
    #when pick_list_qty greater than available packages
[32m      outwards available packages and closes the picklist item[0m
  #Single Quantity Packages
    #when picklist item quantity less than a package quantity
[32m      creates child package and outwards child package[0m

Picklists::BulkReturnInwardService
  #Multi Quantity Packages
    #when valid params are passed
[32m      inbins the given amount of packages[0m
    #When invalid PickList is given
[32m      Should return error msg[0m
    #When Additional variants are given
[32m      Should return error msg[0m
    #When wrong variants are given
[32m      Should return error msg[0m
    #When quantity is higher than picked_quantity-ordered_quantity
[32m      Should return error msg[0m

Picklists::OutwardService
  #Multi Quantity Packages
    #when picklist item quantity less than a package quantity
[32m      creates child package and outwards child package[0m
    #when picklist item quantity is equal to package quantity
[32m      outwards packages[0m
    #when picklist item quantity is greater than package quantity
[32m      splits and outwards packages[0m
    #when both qc pass and qc failed qty are given
[32m      creates child packages for qc pass and fail[0m
    #when pick_list_qty greater than available packages
[32m      outwards available packages and closes the picklist item[0m
  #Single Quantity Packages
    #when picklist item quantity less than a package quantity
[32m      creates child package and outwards child package[0m
  Multi quantity Packages (order picklist)
    Single Order Picklist
[32m      should auto process[0m

Picklists::ReturnInwardService
  #Multi Quantity Packages
    #when returns all the pick list item quantity
[32m      inbins all the picklist item packages[0m
    #when returns all the pick list item quantity but a package is packed
[32m      inbins all the picklist item packages[0m
    #when pick list item returns partailly and return quantity matches to package quantity
[32m      pacakges moved to in_bin[0m
    #when pick list item returns partailly and return quantity doesn't matches to package quantity
[32m      creates child packages and moves to inbin[0m
  #Single Quantity Packages
    when return quantity equals to packages
[32m      returns success[0m
    when return quantity less than packages
[32m      returns success[0m
  errors
    when picklist is not closed
[32m      returns error[0m
    nil check
[32m      returns errors[0m

PurchaseOrders::EditPoService
  For TO with normal transfer type
    behaves like PO update behaviour on Picklist close
      When all required data is present
[32m        should edit po based on picked quantities and delete poli if qty is zero[0m
      When picked qty is zero for all items
[32m        should delete the po[0m
      When pick list is not present
[32m        should return error[0m
      When transfer order is not present
[32m        should return error[0m
  For TO with sku_swap transfer type
    behaves like PO update behaviour on Picklist close
      When all required data is present
[32m        should edit po based on picked quantities and delete poli if qty is zero[0m
      When picked qty is zero for all items
[32m        should delete the po[0m
      When pick list is not present
[32m        should return error[0m
      When transfer order is not present
[32m        should return error[0m

Variants::CreateService
  #new variant!
[32m    creates variant with market place mappings[0m
  #existing variant!
[32m    creates variant market place mappings with different market_places[0m
  #empty variant attributes with nil seller
[32m    returns errors[0m

CreatePackagesAndGroupPackagesWorker
  create_packages
    Create GRN Item Packages
[32m      is expected to receive perform_async(*(any args)) 2 times[0m

DemandAssignItemsWorker
  assign items
    partial assignment
      Assign Items
[32m        is expected to eq "open"[0m
    partial assignment with less than 1
      Assign Items
[32m        is expected to eq "open"[0m
    full assignment
      Assign Items
[32m        is expected to eq "fulfilled"[0m

DemandChangeStatusWorker
  change status
    change status
      status should be changed for demands that have been open for more than last 5 days
[32m        is expected to eq "cancelled"[0m

PickupAgentStockUpdateWorker
  PickupAgentStockUpdateWorker
    Failure case
[32m      should push error[0m
    Success
[32m      example at ./spec/workers/pickup_agent_stock_update_worker_spec.rb:103[0m

PushWHDataAsyncWorker
  push_wh_data_async
    Push WH Data Async
[32m      example at ./spec/workers/push_wh_data_async_worker_spec.rb:11[0m

ReconcileUpdateTransferPriceWorker
  push_wh_data_async
    Update transfer Price
[32m      is expected to receive perform_async(*(any args)) 1 time[0m

JobHelper
  get_variant_creation_status_v2
    Sync Missing Variants
[32m      is expected to receive perform_async(55924, 471) 1 time[0m

UpdateMarketPlaceStockWorker
  UpdateMarketPlaceStockWorker
    success
[32m      should update warehouse wise stock[0m
[32m      should update warehouse wise stock (stock_sync_disabled warehouses not passed in args)[0m

SellerWarehouseMapping
  update_seller_address
    Update Seller Address
[32m      is expected to receive perform_async(55) 1 time[0m

OrderHelper
  update_transfer_price
    Update Transfer Price/Stock Sync
[32m      is expected to receive perform_in(anything, 165) 1 time[0m
      oms api valid failure
[32m        is expected to eq false[0m
      oms api failure (timeout/server error)
[32m        is expected to eq false[0m
      success
[32m        is expected to eq true[0m

UpdateVariantWarehouseStockWorker
  UpdateVariantWarehouseStockWorker
    Success case
[32m      is expected to eq 100[0m

UpdateVolatileStockWorker
  UpdateVolatileStockWorker
    success case
[32m      is expected to eq {"message"=>"updated successfully", "success"=>true}[0m
    failure case
[32m      is expected to eq nil[0m

UpdateWarehouseStockWorker
  UpdateWarehouseStockWorker
    On success
[32m      should create jobs to sync stock in market_place[0m
    On failure
[32m      should report error when some error occurs[0m

Failures:

  1) demands_controller POST Create Transfer Order create demand TO  create success
     [31mFailure/Error: [0m[32mexpect[0m(json_response[[31m[1;31m'[0m[31msuccess[1;31m'[0m[31m[0m]).to eq([1;36mtrue[0m)[0m
     [31m[0m
     [31m  expected: true[0m
     [31m       got: false[0m
     [31m[0m
     [31m  (compared using ==)[0m
     [31m[0m
     [31m  Diff:[0m[0m
     [31m  [0m[34m@@ -1 +1 @@[0m
     [31m  [0m[31m-true[0m
     [31m  [0m[32m+false[0m
     [31m  [0m[0m
     [36m# ./spec/requests/demands/create_transfer_order_spec.rb:102:in `block (4 levels) in <top (required)>'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/webmock-3.14.0/lib/webmock/rspec.rb:37:in `block (2 levels) in <top (required)>'[0m
     [36m# ./spec/support/database_cleaner.rb:25:in `block (3 levels) in <top (required)>'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/strategy.rb:30:in `cleaning'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/cleaners.rb:34:in `block (2 levels) in cleaning'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/cleaners.rb:35:in `cleaning'[0m
     [36m# ./spec/support/database_cleaner.rb:24:in `block (2 levels) in <top (required)>'[0m

  2) demands_controller GET List Demand filter by from_date and to_date
     [31mFailure/Error: [0m[32mexpect[0m(json_response[[31m[1;31m'[0m[31mdata[1;31m'[0m[31m[0m].count).to eq([1;34m2[0m)[0m
     [31m[0m
     [31m  expected: 2[0m
     [31m       got: 0[0m
     [31m[0m
     [31m  (compared using ==)[0m
     [36m# ./spec/requests/demands/list_demand_spec.rb:86:in `block (3 levels) in <top (required)>'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/webmock-3.14.0/lib/webmock/rspec.rb:37:in `block (2 levels) in <top (required)>'[0m
     [36m# ./spec/support/database_cleaner.rb:25:in `block (3 levels) in <top (required)>'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/strategy.rb:30:in `cleaning'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/cleaners.rb:34:in `block (2 levels) in cleaning'[0m
     [36m# /Users/suriyasrinivasan/.rvm/gems/ruby-2.7.3/gems/database_cleaner-core-2.0.1/lib/database_cleaner/cleaners.rb:35:in `cleaning'[0m
     [36m# ./spec/support/database_cleaner.rb:24:in `block (2 levels) in <top (required)>'[0m

Finished in 2 minutes 14 seconds (files took 7.28 seconds to load)
[31m798 examples, 2 failures[0m

Failed examples:

[31mrspec ./spec/requests/demands/create_transfer_order_spec.rb:99[0m [36m# demands_controller POST Create Transfer Order create demand TO  create success[0m
[31mrspec ./spec/requests/demands/list_demand_spec.rb:83[0m [36m# demands_controller GET List Demand filter by from_date and to_date[0m

