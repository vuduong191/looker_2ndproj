- dashboard: bundle_sales_au
  title: Bundle Sales AU
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: '86400000'
  filters:
  - name: date
    title: 'Date Range'
    type: date_filter
    default_value: 3 months

  - name: date_aggregation
    type: field_filter
    model: ettitude_vu02_au
    explore: order
    field: order.timeframe_picker
    default_value: "Week"

  elements:
  - name: bundle_sale_overall_au
    title: Net Sales and Order Count
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count, bundle_sales.total_pre_tax_price, bundle_sales.order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [bundle_sales.order_count, bundle_sales.total_pre_tax_price]
    width: 12
  - name: bundle_sales_contribution
    title: Bundle Net Sale Contribution
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count, bundle_sales.total_pre_tax_price, bundle_sales.order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    dynamic_fields:
    - table_calculation: net_sales_contribution
      label: Net Sales Contribution
      expression: "${bundle_sales.bundle_total_pre_tax_price}/${bundle_sales.total_pre_tax_price}"
      value_format:
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [bundle_sales.order_count, bundle_sales.total_pre_tax_price, bundle_sales.bundle_order_count,
      bundle_sales.bundle_total_pre_tax_price]
    width: 12


  - name: net_sales_by_bundle_au
    title: Net Sales Contribution by Bundles (vs Total Net Sales)
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_bar
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.property_discount_name]
    pivots: [bundle_sales.property_discount_name]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: "-NULL"
    sorts: [bundle_sales.property_discount_name 0, bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    hidden_series: [bundle_sales.property_discount_name___null - bundle_sales.bundle_total_pre_tax_price]
    series_types: {}
    reference_lines: []
    trend_lines: []
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    hidden_fields:
    width: 12
    height: 8



  - name: cleanBamboobedding_bundle_au
    title: CleanBamboo Bedding Bundle
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: CleanBamboo Bedding Bundle
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 57}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 57}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 60}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 60}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 67}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    width: 12

  - name: basic_bedding_bundle_au
    title: Basic Bedding Bundle
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: Basic Bedding Bundle
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 57}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 57}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 60}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 60}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 67}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    width: 12

  - name: complete_bedding_bundle_au
    title: Complete Bedding Bundle
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: Complete Bedding Bundle
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 57}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 57}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 60}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 60}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 67}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    width: 12


  - name: men_pyjama_bundle_au
    title: Men's pyjama Bundle
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: Men's Pyjama Bundle
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 57}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 57}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 60}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 60}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 67}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    width: 12

  - name: women_pyjama_bundle_au
    title: Women's pyjama Bundle
    model: ettitude_vu02_au
    explore: bundle_sales
    type: looker_line
    fields: [bundle_sales.dynamic_timeframe, bundle_sales.bundle_total_pre_tax_price,
      bundle_sales.bundle_order_count]
    listen:
      date_aggregation: bundle_sales.timeframe_picker
      date: bundle_sales.createdgroup_date
    filters:
      bundle_sales.property_discount_name: Women's Pyjama Bundle
    sorts: [bundle_sales.dynamic_timeframe]
    limit: 500
    query_timezone: Australia/Melbourne
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
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: bundle_sales.bundle_total_pre_tax_price,
            id: bundle_sales.bundle_total_pre_tax_price, name: Bundle Net Sales, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 57}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 57}, {label: !!null '', orientation: right, series: [{axisId: bundle_sales.bundle_order_count,
            id: bundle_sales.bundle_order_count, name: Bundle Order Count, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
            __LINE_NUM: 60}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 60}]
    series_types:
      bundle_sales.bundle_order_count: column
    reference_lines: []
    trend_lines: [{color: "#4276BE", label_position: right, period: 7, regression_type: linear,
        series_index: 1, show_label: true, __FILE: ettitude_vu02_au/dashboards/bundle_sales_au.dashboard.lookml,
        __LINE_NUM: 67}]
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: []
    width: 12
