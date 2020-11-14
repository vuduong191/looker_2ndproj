- dashboard: markdown_au
  title: Markdown AU
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: '86400000'
  elements:
  - name: pj_burndown_au2
    title: Markdown AU
    model: ettitude_vu02_au
    explore: woh
    type: looker_grid
    fields: [woh.sku, woh.category, woh.product, woh.color, woh.material, woh.size,
      woh.price, woh.compare_at_price, woh.sum_inventory, woh.sum_weekly_unit_sold]
    filters:
      woh.category: '"Women''s wear","Men''s Wear"'
    sorts: [woh.category, woh.product, woh.color]
    limit: 500
    dynamic_fields:
    - table_calculation: woh
      label: WOH
      expression: "${woh.sum_inventory}/${woh.sum_weekly_unit_sold}"
      value_format:
      value_format_name: decimal_1
      _kind_hint: measure
      _type_hint: number
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    show_totals: true
    show_row_totals: true
    series_cell_visualizations:
      woh.sum_inventory:
        is_active: false
      woh:
        is_active: true
    series_value_format:
      woh:
        name: decimal_1
        format_string: "#,##0.0"
        label: Decimals (1)
    woh.category: '"Men''s Wear","Women''s wear"'
    label: Decimals (1)
    expression: "${woh.sum_inventory}/${woh.sum_weekly_unit_sold}"
    value_format:
    value_format_name: decimal_1
    _kind_hint: measure
    _type_hint: number
    woh.sum_inventory:
    is_active: true
    woh:
    format_string: "#,##0.0"
    defaults_version: 1
    hidden_fields: [woh.sum_weekly_unit_sold]
    series_types: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    row: 0
    col: 0
    width: 24
    height: 12
