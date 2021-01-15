- dashboard: product_performance_au
  title: Product Performance Au
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
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.timeframe_picker
    default_value: "Week"

  - name: product_grouping_picker
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.product_grouping_picker
    default_value: "Category"

  - name: category
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.category
  - name: product
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.product
  - name: color
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.color

  - name: material
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.material
  - name: size
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.size
  - name: sku
    type: field_filter
    model: ettitude_vu02_au
    explore: variant_daily_sales_3
    field: variant_daily_sales_3.sku
  elements:
    - name: text_01
      type: text
#       title_text: "@{test_h1_tag}"
      body_text: |-
        <div style="height: 120px; text-align: left; margin: 0px; padding:0px">
            <svg height="100" viewBox="0 0 512 512">
                <g>
                    <path fill="#d16b54" d="m488.468 88.177h-464.936c-12.975 0-23.532 10.557-23.532 23.532v288.581c0 12.976 10.557 23.532 23.532 23.532h384.776c4.142 0 7.5-3.358 7.5-7.5s-3.358-7.5-7.5-7.5h-384.776c-4.705 0-8.532-3.828-8.532-8.532v-136.79h232.984c8.556 0 15.516-6.96 15.516-15.516v-144.807h224.968c4.705 0 8.532 3.828 8.532 8.532v288.581c0 4.705-3.828 8.532-8.532 8.532h-48.1c-4.142 0-7.5 3.358-7.5 7.5s3.358 7.5 7.5 7.5h48.1c12.976 0 23.532-10.557 23.532-23.532v-288.581c0-12.975-10.557-23.532-23.532-23.532zm-329.177 115.202h1.312l69.938 45.121h-71.25zm28.981 0h35.664c4.142 0 7.5-3.358 7.5-7.5s-3.358-7.5-7.5-7.5h-72.145c-4.142 0-7.5 3.358-7.5 7.5v52.621h-25.081v-52.621c0-4.142-3.358-7.5-7.5-7.5h-96.71v-25.081h96.709c4.142 0 7.5-3.358 7.5-7.5v-52.621h25.081v52.621c0 4.142 3.358 7.5 7.5 7.5h96.71v78.938zm-84.063-55.081h-1.312l-69.938-45.121h71.25zm-28.981 0h-60.228v-36.589c0-.723.1-1.422.271-2.094zm-60.228 55.081h60.228l-60.228 38.857zm87.897 0h1.312v45.121h-71.25zm56.394-55.081v-45.121h71.25l-69.937 45.121zm89.209 0h-60.228l60.228-38.857z"/>
                    <path fill="#d16b54" d="m335.647 248.324c0-.768-.119-1.548-.369-2.317-1.28-3.94-5.515-6.097-9.45-4.815l-3.531 1.147v-3.712c0-4.142-3.358-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v3.712l-3.531-1.147c-3.941-1.281-8.171.876-9.45 4.815-.25.77-.369 1.55-.369 2.317 0 3.162 2.015 6.103 5.185 7.133l3.531 1.147-2.182 3.003c-.968 1.332-1.434 2.875-1.433 4.404 0 2.318 1.073 4.604 3.092 6.071 1.331.967 2.874 1.433 4.402 1.433 2.319 0 4.606-1.072 6.074-3.092l2.183-3.003 2.182 3.003c2.436 3.352 7.125 4.094 10.476 1.66 2.019-1.467 3.091-3.753 3.092-6.071 0-1.529-.465-3.073-1.433-4.405l-2.182-3.003 3.53-1.147c3.168-1.03 5.184-3.971 5.183-7.133z"/>
                    <path fill="#d16b54" d="m399.776 344.517c0-.767-.119-1.548-.369-2.317-1.28-3.939-5.512-6.097-9.451-4.815l-3.531 1.147v-3.712c0-4.142-3.358-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v3.712l-3.531-1.147c-3.942-1.282-8.171.876-9.451 4.815-.25.77-.369 1.55-.369 2.317-.001 3.163 2.014 6.104 5.184 7.133l3.531 1.147-2.182 3.003c-.968 1.332-1.434 2.875-1.433 4.405 0 2.318 1.073 4.604 3.092 6.071 1.332.967 2.874 1.433 4.402 1.433 2.319 0 4.606-1.072 6.074-3.092l2.183-3.003 2.182 3.003c2.434 3.351 7.125 4.094 10.476 1.66 2.02-1.467 3.092-3.753 3.092-6.072 0-1.529-.465-3.073-1.433-4.404l-2.182-3.003 3.531-1.147c3.171-1.03 5.186-3.971 5.185-7.134z"/>
                    <path fill="#d16b54" d="m378.926 150.964c-4.142 0-7.5 3.358-7.5 7.5v3.712l-3.531-1.147c-3.942-1.281-8.171.876-9.451 4.815-.25.77-.369 1.55-.369 2.317-.001 3.163 2.014 6.104 5.184 7.133l3.531 1.147-2.182 3.004c-.968 1.332-1.434 2.875-1.433 4.404 0 2.318 1.073 4.604 3.092 6.071 3.351 2.435 8.042 1.692 10.476-1.659l2.183-3.003 2.182 3.003c1.468 2.02 3.755 3.092 6.074 3.092 1.528 0 3.071-.466 4.402-1.433 2.019-1.467 3.091-3.753 3.092-6.071 0-1.529-.465-3.073-1.433-4.405l-2.183-3.004 3.532-1.147c3.17-1.03 5.185-3.971 5.184-7.133 0-.767-.119-1.548-.369-2.317-1.28-3.939-5.512-6.097-9.451-4.815l-3.531 1.147v-3.712c.001-4.141-3.357-7.499-7.499-7.499z"/>
                    <path fill="#d16b54" d="m440.873 236.36 2.182-3.003 2.183 3.003c1.467 2.02 3.754 3.092 6.074 3.092 1.528 0 3.071-.466 4.402-1.433 2.02-1.467 3.092-3.753 3.092-6.071 0-1.529-.465-3.073-1.433-4.404l-2.182-3.003 3.531-1.147c3.17-1.03 5.185-3.971 5.185-7.133 0-.768-.119-1.548-.369-2.317-1.28-3.939-5.512-6.097-9.45-4.815l-3.531 1.147v-3.712c0-4.142-3.358-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v3.712l-3.531-1.147c-3.941-1.281-8.17.876-9.45 4.815-.25.769-.369 1.55-.369 2.317-.001 3.162 2.015 6.103 5.185 7.133l3.53 1.147-2.182 3.003c-.967 1.332-1.433 2.875-1.433 4.405.001 2.318 1.073 4.604 3.092 6.071 3.349 2.434 8.039 1.69 10.474-1.66z"/>
                    <path fill="#d16b54" d="m177.387 326.359c0-.768-.119-1.548-.369-2.317-1.28-3.94-5.514-6.098-9.45-4.815l-18.978 6.166v-19.954c0-4.142-3.358-7.5-7.5-7.5s-7.5 3.358-7.5 7.5v19.954l-18.978-6.166c-3.94-1.282-8.171.876-9.45 4.815-.25.769-.369 1.55-.369 2.317-.001 3.162 2.014 6.103 5.185 7.133l18.977 6.166-11.729 16.143c-.967 1.332-1.433 2.875-1.433 4.405 0 2.318 1.073 4.604 3.092 6.071 1.331.967 2.874 1.433 4.402 1.433 2.319 0 4.606-1.072 6.074-3.092l11.728-16.143 11.729 16.143c2.435 3.351 7.124 4.094 10.476 1.659 2.019-1.467 3.091-3.753 3.092-6.071 0-1.529-.465-3.073-1.433-4.404l-11.729-16.143 18.977-6.166c3.172-1.031 5.187-3.972 5.186-7.134z"/>
                    <path fill="#d16b54" d="m407.871 264.016c0-4.142-3.358-7.5-7.5-7.5h-.08c-4.142 0-7.46 3.358-7.46 7.5s3.398 7.5 7.54 7.5 7.5-3.358 7.5-7.5z"/>
                </g>
            </svg>
          </div>
      row: 0
      col: 0
      width: 24
      height: 3
    - name: overall
      title: Units Sold, Ending Inventory, Sell-through Rate by Product and Product Group
      model: ettitude_vu02_au
      explore: variant_daily_sales_3
      type: looker_grid
      fields: [
        variant_daily_sales_3.dynamic_timeframe, variant_daily_sales_3.total_pre_tax_price,
        variant_daily_sales_3.total_unit_sold, variant_daily_sales_3.total_of_ending_inventory,
        variant_daily_sales_3.sell_through_rate, variant_daily_sales_3.dynamic_week_count_final,
        variant_daily_sales_3.dynamic_product_grouping
        ]
      pivots: [variant_daily_sales_3.dynamic_product_grouping]
      listen:
        date_aggregation: variant_daily_sales_3.timeframe_picker
        date:  variant_daily_sales_3.day
        category: variant_daily_sales_3.category
        color: variant_daily_sales_3.color
        product_grouping_picker: variant_daily_sales_3.product_grouping_picker
        material: variant_daily_sales_3.material
        product: variant_daily_sales_3.product
        size: variant_daily_sales_3.size
        sku: variant_daily_sales_3.sku
      filters:
        variant_daily_sales_3._445_year: ">2018"
        variant_daily_sales_3.date_number_445_full: NOT NULL
      sorts: [variant_daily_sales_3.dynamic_product_grouping 0, variant_daily_sales_3.dynamic_timeframe desc 0]
      limit: 500
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
      series_labels:
      variant_daily_sales_3.dynamic_timeframe: Period
      series_column_widths:
      variant_daily_sales_3.dynamic_timeframe: 80
      variant_daily_sales_3.total_pre_tax_price: 100
      variant_daily_sales_3.total_unit_sold: 80
      variant_daily_sales_3.total_of_ending_inventory: 80
      variant_daily_sales_3.dynamic_week_count_final: 70
      variant_daily_sales_3.sell_through_rate: 70
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
      show_null_points: true
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: [
        variant_daily_sales_3.total_pre_tax_price,
        variant_daily_sales_3.total_of_ending_inventory,
        variant_daily_sales_3.sell_through_rate, variant_daily_sales_3.dynamic_week_count_final,
        variant_daily_sales_3.dynamic_product_grouping]
      row: 3
      col: 0
      width: 24
      height: 16
    - name: text_02343
      type: text
      row: 16
      col: 0
      width: 24
      height: 2
    - name: overall232
      title: Units Sold, Ending Inventory, Sell-through Rate by Product and Product Group
      model: ettitude_vu02_au
      explore: variant_daily_sales_3
      type: looker_grid
      fields: [
        variant_daily_sales_3.dynamic_timeframe, variant_daily_sales_3.total_pre_tax_price,
        variant_daily_sales_3.total_unit_sold, variant_daily_sales_3.total_of_ending_inventory,
        variant_daily_sales_3.sell_through_rate, variant_daily_sales_3.dynamic_week_count_final,
        variant_daily_sales_3.dynamic_product_grouping
        ]
      pivots: [variant_daily_sales_3.dynamic_product_grouping]
      listen:
        date_aggregation: variant_daily_sales_3.timeframe_picker
        date:  variant_daily_sales_3.day
        category: variant_daily_sales_3.category
        color: variant_daily_sales_3.color
        product_grouping_picker: variant_daily_sales_3.product_grouping_picker
        material: variant_daily_sales_3.material
        product: variant_daily_sales_3.product
        size: variant_daily_sales_3.size
        sku: variant_daily_sales_3.sku
      filters:
        variant_daily_sales_3._445_year: ">2018"
        variant_daily_sales_3.date_number_445_full: NOT NULL
      sorts: [variant_daily_sales_3.dynamic_product_grouping 0, variant_daily_sales_3.dynamic_timeframe desc 0]
      limit: 500
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
      series_labels:
      variant_daily_sales_3.dynamic_timeframe: Period
      series_column_widths:
      variant_daily_sales_3.dynamic_timeframe: 80
      variant_daily_sales_3.total_pre_tax_price: 100
      variant_daily_sales_3.total_unit_sold: 80
      variant_daily_sales_3.total_of_ending_inventory: 80
      variant_daily_sales_3.dynamic_week_count_final: 70
      variant_daily_sales_3.sell_through_rate: 70
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
      show_null_points: true
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: [variant_daily_sales_3.total_pre_tax_price, variant_daily_sales_3.dynamic_week_count_final]
      row: 18
      col: 0
      width: 24
      height: 16
    - name: text_02
      type: text
      row: 24
      col: 0
      width: 24
      height: 2
    - name: overall1
      title: Sales, Units Sold by Product and Product Group
      model: ettitude_vu02_au
      explore: variant_daily_sales_3
      type: looker_grid
      fields: [
        variant_daily_sales_3.dynamic_timeframe, variant_daily_sales_3.total_pre_tax_price,
        variant_daily_sales_3.total_unit_sold, variant_daily_sales_3.total_of_ending_inventory,
        variant_daily_sales_3.sell_through_rate, variant_daily_sales_3.dynamic_week_count_final,
        variant_daily_sales_3.dynamic_product_grouping
        ]
      pivots: [variant_daily_sales_3.dynamic_product_grouping]
      listen:
        date_aggregation: variant_daily_sales_3.timeframe_picker
        date:  variant_daily_sales_3.day
        category: variant_daily_sales_3.category
        color: variant_daily_sales_3.color
        product_grouping_picker: variant_daily_sales_3.product_grouping_picker
        material: variant_daily_sales_3.material
        product: variant_daily_sales_3.product
        size: variant_daily_sales_3.size
        sku: variant_daily_sales_3.sku
      filters:
        variant_daily_sales_3._445_year: ">2018"
        variant_daily_sales_3.date_number_445_full: NOT NULL
      sorts: [variant_daily_sales_3.dynamic_product_grouping 0, variant_daily_sales_3.dynamic_timeframe desc 0]
      limit: 500
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
      series_labels:
      variant_daily_sales_3.dynamic_timeframe: Period
      series_column_widths:
      variant_daily_sales_3.dynamic_timeframe: 80
      variant_daily_sales_3.total_pre_tax_price: 100
      variant_daily_sales_3.total_unit_sold: 80
      variant_daily_sales_3.total_of_ending_inventory: 80
      variant_daily_sales_3.dynamic_week_count_final: 70
      variant_daily_sales_3.sell_through_rate: 70
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
      show_null_points: true
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: [variant_daily_sales_3.total_of_ending_inventory, variant_daily_sales_3.sell_through_rate]
      row: 26
      col: 0
      width: 24
      height: 16


    - name: text_dd
      type: text
      row: 32
      col: 0
      width: 24
      height: 2

    - name: overall3
      title: Sales, Units Sold, Ending Inventory, and Sell-through Rate by Product and Product Group
      model: ettitude_vu02_au
      explore: variant_daily_sales_3
      type: looker_grid
      fields: [
        variant_daily_sales_3.dynamic_timeframe, variant_daily_sales_3.total_pre_tax_price,
        variant_daily_sales_3.total_unit_sold, variant_daily_sales_3.total_of_ending_inventory,
        variant_daily_sales_3.sell_through_rate, variant_daily_sales_3.dynamic_week_count_final,
        variant_daily_sales_3.dynamic_product_grouping
        ]
      pivots: [variant_daily_sales_3.dynamic_product_grouping]
      listen:
        date_aggregation: variant_daily_sales_3.timeframe_picker
        date:  variant_daily_sales_3.day
        category: variant_daily_sales_3.category
        color: variant_daily_sales_3.color
        product_grouping_picker: variant_daily_sales_3.product_grouping_picker
        material: variant_daily_sales_3.material
        product: variant_daily_sales_3.product
        size: variant_daily_sales_3.size
        sku: variant_daily_sales_3.sku
      filters:
        variant_daily_sales_3._445_year: ">2018"
        variant_daily_sales_3.date_number_445_full: NOT NULL
      sorts: [variant_daily_sales_3.dynamic_product_grouping 0, variant_daily_sales_3.dynamic_timeframe desc 0]
      limit: 500
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
      series_labels:
      variant_daily_sales_3.dynamic_timeframe: Period
      series_column_widths:
      variant_daily_sales_3.dynamic_timeframe: 80
      variant_daily_sales_3.total_pre_tax_price: 100
      variant_daily_sales_3.total_unit_sold: 80
      variant_daily_sales_3.total_of_ending_inventory: 80
      variant_daily_sales_3.dynamic_week_count_final: 70
      variant_daily_sales_3.sell_through_rate: 70
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
      show_null_points: true
      interpolation: linear
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      # hidden_fields: [variant_daily_sales_3.total_pre_tax_price, variant_daily_sales_3.dynamic_week_count_final]
      row: 34
      col: 0
      width: 24
      height: 24
