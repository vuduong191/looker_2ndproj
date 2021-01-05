- dashboard: sales_performance
  title: Sales Performance AU
  preferred_viewer: dashboards-next
  refresh: '86400000'
  filters:
  - name: date
    title: 'Date Range'
    type: date_filter
    default_value: 2 months

  - name: date_aggregation
    type: field_filter
    model: ettitude_vu02_au
    explore: order
    field: order.timeframe_picker
    default_value: "Week"
  elements:
  - name: net_sales_au
    title: Net Sales before Tax
    model: ettitude_vu02_au
    explore: order_line
    type: looker_column
    fields: [order.dynamic_timeframe, order_line.total_pre_tax_price, order_line.sum_of_quantity,
      order_line.order_count]
    listen:
      date_aggregation: order.timeframe_picker
      date: order.created_date
    filters:
      order.online_order: 'Yes'
      order.is_cancelled: 'No'
      order_is_b2b.is_b2b: 'No'
      order_is_marketing.is_marketing: 'No'
    sorts: [order.dynamic_timeframe]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: basket_size
      label: basket_size
      expression: "${order_line.sum_of_quantity}/${order_line.order_count}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: aov
      label: aov
      expression: "${order_line.total_pre_tax_price}/${order_line.order_count}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: order_line.total_pre_tax_price,
            id: order_line.total_pre_tax_price, name: Total Pre Tax Price}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: order_line.order_count,
            id: order_line.order_count, name: Number of Orders}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    label_value_format: 0.0, "K"
    series_types:
      order_line.order_count: line
    defaults_version: 1
    hidden_fields: [order_line.sum_of_quantity, basket_size, aov]
    row: 0
    col: 0
    width: 12
    height: 3
  - name: aov_basket_size_au
    title: AOV & Basket Size
    model: ettitude_vu02_au
    explore: order_line
    type: looker_column
    fields: [order.dynamic_timeframe, order_line.total_pre_tax_price, order_line.sum_of_quantity,
      order_line.order_count]
    listen:
      date_aggregation: order.timeframe_picker
      date: order.created_date
    filters:
      order.online_order: 'Yes'
      order.is_cancelled: 'No'
      order_is_b2b.is_b2b: 'No'
      order_is_marketing.is_marketing: 'No'
    sorts: [order.dynamic_timeframe]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - table_calculation: basket_size
      label: basket_size
      expression: "${order_line.sum_of_quantity}/${order_line.order_count}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    - table_calculation: aov
      label: aov
      expression: "${order_line.total_pre_tax_price}/${order_line.order_count}"
      value_format:
      value_format_name: usd
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: basket_size, id: basket_size,
            name: basket_size}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}, {label: '', orientation: right, series: [
          {axisId: aov, id: aov, name: aov}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, type: linear}]
    label_value_format: ''
    series_types:
      order_line.order_count: line
    defaults_version: 1
    hidden_fields: [order_line.sum_of_quantity, order_line.total_pre_tax_price, order_line.order_count]
    row: 3
    col: 0
    width: 12
    height: 3
  - name: category_contribution_au
    title: Net Sales by Category
    model: ettitude_vu02_au
    explore: order_line
    type: looker_bar
    listen:
      date_aggregation: order.timeframe_picker
      date: order.created_date
    filters:
      order.online_order: 'Yes'
      order.is_cancelled: 'No'
      order_is_b2b.is_b2b: 'No'
      order_is_marketing.is_marketing: 'No'
      vu_product_data_au.category: "-NULL"
    fields: [vu_product_data_au.category, order.dynamic_timeframe, order_line.total_pre_tax_price]
    pivots: [vu_product_data_au.category]
    sorts: [vu_product_data_au.category 0, order.dynamic_timeframe]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields:
    row: 6
    col: 0
    width: 12
    height: 4
  - name: color_contribution_au
    title: Bedding - Contribution by Color
    model: ettitude_vu02_au
    explore: order_line
    type: looker_bar
    listen:
      date_aggregation: order.timeframe_picker
      date: order.created_date
    filters:
      order.online_order: 'Yes'
      order.is_cancelled: 'No'
      order_is_b2b.is_b2b: 'No'
      order_is_marketing.is_marketing: 'No'
      vu_product_data_au.category: Bedding
    fields: [order.dynamic_timeframe, order_line.total_pre_tax_price, vu_product_data_au.color]
    pivots: [vu_product_data_au.color]
    sorts: [order.dynamic_timeframe, vu_product_data_au.color]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
      Feather White - order_line.total_pre_tax_price: "#eee"
      Grey - order_line.total_pre_tax_price: "#cfcfcf"
      Sage - order_line.total_pre_tax_price: "#B2AC88"
      Blue Nights - order_line.total_pre_tax_price: "#3d62bf"
      Cloud Pink - order_line.total_pre_tax_price: "#b0576d"
      Sand - order_line.total_pre_tax_price: "#ebba59"
      na - order_line.total_pre_tax_price: "#9174F0"
      Pepper - order_line.total_pre_tax_price: "#375259"
      Starlight Blue - order_line.total_pre_tax_price: "#75E2E2"
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields:
    row: 10
    col: 0
    width: 12
    height: 4
  - name: product_contribution_au
    title: Bedding - Contribution by Product
    model: ettitude_vu02_au
    explore: order_line
    type: looker_bar
    listen:
      date_aggregation: order.timeframe_picker
      date: order.created_date
    filters:
      order.online_order: 'Yes'
      order.is_cancelled: 'No'
      order_is_b2b.is_b2b: 'No'
      order_is_marketing.is_marketing: 'No'
      vu_product_data_au.category: Bedding
    fields: [order.dynamic_timeframe, order_line.total_pre_tax_price, vu_product_data_au.product]
    pivots: [vu_product_data_au.product]
    sorts: [order.dynamic_timeframe, vu_product_data_au.product]
    limit: 500
    query_timezone: America/Los_Angeles
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: percent
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: true
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: desc
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    series_types: {}
    series_colors:
    Feather White - order_line.total_pre_tax_price: "#eee"
    Grey - order_line.total_pre_tax_price: "#cfcfcf"
    Sage - order_line.total_pre_tax_price: "#B2AC88"
    Blue Nights - order_line.total_pre_tax_price: "#3d62bf"
    Cloud Pink - order_line.total_pre_tax_price: "#b0576d"
    Sand - order_line.total_pre_tax_price: "#ebba59"
    na - order_line.total_pre_tax_price: "#9174F0"
    Pepper - order_line.total_pre_tax_price: "#375259"
    Starlight Blue - order_line.total_pre_tax_price: "#75E2E2"
    show_dropoff: false
    defaults_version: 1
    show_null_points: true
    interpolation: linear
    hidden_fields:
    row: 14
    col: 0
    width: 12
    height: 4
