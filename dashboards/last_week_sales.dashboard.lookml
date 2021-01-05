- dashboard: last_week_sales
  title: Last Week Sales AU
  layout: newspaper
  preferred_viewer: dashboards-next
  refresh: 1 days
  filters:

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
    - name: text_02
      type: text
      title_text: Net Sales
      subtitle_text:  Gross Sales - Discount + Shipping. Refund and return orders are excluded.
      row: 3
      col: 0
      width: 24
      height: 2
    - name: last_week_sales
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.current_period_sales]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: Last complete week Net Sales
      value_format: "$###,###"
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      row: 5
      col: 0
      height: 6
      width: 8
    - name: pop_net_sale
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.sales_pop_change]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
        color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
        than, value: 0, background_color: '', font_color: "#C68381", color_application: {
          collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
      single_value_title: "% Change vs previous week"
      value_format: "#.00%"
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: []
      row: 5
      col: 8
      height: 6
      width: 4
    - name: yoy_net_sales
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.sales_yoy_change]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: "% Change YOY"
      value_format: "#.00%"
      comparison_label: Previous week
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
            than, value: 0, background_color: '', font_color: "#C68381", color_application: {
            collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
          italic: false, strikethrough: false, fields: !!null ''}]
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: []
      row: 5
      col: 12
      height: 6
      width: 4
    - name: 8_weeks
      title: Last 8 Week Net Sales
      model: ettitude_vu02_au
      explore: order_summary_2
      type: looker_column
      fields: [order_summary_2.445_week, order_summary_2.sum_of_net_sales, order_summary_2.date_number_445_full]
      filters:
        order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      sorts: [order_summary_2.date_number_445_full]
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
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
      hide_legend: false
      label_value_format: "$###,###"
      series_types: {}
      series_colors:
        order_summary_2.sum_of_net_sales: "#ABC0D2"
      show_dropoff: true
      custom_color_enabled: true
      custom_color: "#4d578c"
      show_single_value_title: true
      single_value_title: Previous Net Sales
      value_format: "$###,###"
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: Previous week
      enable_conditional_formatting: false
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
            than, value: 0, background_color: '', font_color: "#C68381", color_application: {
            collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
          italic: false, strikethrough: false, fields: !!null ''}]
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      hidden_fields: [order_summary_2.date_number_445_full]
      row: 5
      col: 16
      height: 6
      width: 8




#       Order Count Section
    - name: text_03
      type: text
      title_text: Order Count
      row: 11
      col: 0
      width: 24
      height: 2
    - name: last_week_order_count
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.current_period_order_count]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: Last complete week Order Count
      value_format: "#,###"
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      row: 13
      col: 0
      height: 6
      width: 8
    - name: pop_order_count
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.order_count_pop_change]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
        color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
        bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
        than, value: 0, background_color: '', font_color: "#C68381", color_application: {
          collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
        italic: false, strikethrough: false, fields: !!null ''}]
      single_value_title: "% Change vs previous week"
      value_format: "#.00%"
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: []
      row: 13
      col: 8
      height: 6
      width: 4
    - name: yoy_order_count
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.order_count_yoy_change]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: true
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: "% Change YOY"
      value_format: "#.00%"
      comparison_label: Previous week
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
            than, value: 0, background_color: '', font_color: "#C68381", color_application: {
            collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
          italic: false, strikethrough: false, fields: !!null ''}]
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
      show_value_labels: false
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      series_types: {}
      hidden_fields: []
      row: 13
      col: 12
      height: 6
      width: 4
    - name: 8_weeks_order_count
      title: Last 8 Week Order Count
      model: ettitude_vu02_au
      explore: order_summary_2
      type: looker_column
      fields: [order_summary_2.445_week, order_summary_2.count_of_order, order_summary_2.date_number_445_full]
      filters:
        order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      sorts: [order_summary_2.date_number_445_full]
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
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
      hide_legend: false
      label_value_format: "#"
      series_types: {}
      series_colors:
        order_summary_2.sum_of_net_sales: "#ABC0D2"
      show_dropoff: true
      custom_color_enabled: true
      custom_color: "#4d578c"
      show_single_value_title: true
      single_value_title: Previous Net Sales
      value_format: "$###,###"
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: Previous week
      enable_conditional_formatting: false
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
            than, value: 0, background_color: '', font_color: "#C68381", color_application: {
            collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
          italic: false, strikethrough: false, fields: !!null ''}]
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      hidden_fields: [order_summary_2.date_number_445_full]
      row: 13
      col: 16
      height: 6
      width: 8






      #       Refund Section
    - name: text_04
      type: text
      title_text: AVG Weekly Refund and AVG Weekly Refund as % of AVG Weekly Total Sales
      subtitle_text: Total Sales = Net Sales + Tax
      row: 19
      col: 0
      width: 24
      height: 2
    - name: last_week_refund
      # title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.current_period_sum_of_refund_amount, order_summary_2.current_period_sum_of_total_prices]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      custom_color: "#4d578c"
      single_value_title: Last complete week refund total
      value_format: "$###,###"
      comparison_label: Total Sales
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0},
          bold: false, italic: false, strikethrough: false, fields: !!null ''}, {type: less
            than, value: 0, background_color: '', font_color: "#C68381", color_application: {
            collection_id: ettitude, palette_id: ettitude-sequential-0}, bold: false,
          italic: false, strikethrough: false, fields: !!null ''}]
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
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount}],
          showLabels: true, showValues: true, valueFormat: "$###,###", unpinAxis: false,
          tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
          series: [{axisId: of_total_sales, id: of_total_sales, name: "% of Total Sales"}],
          showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
          type: linear}]
      limit_displayed_rows_values:
        show_hide: hide
        first_last: first
        num_rows: 0
      hide_legend: false
      label_value_format: ''
      series_types: {}
      series_colors:
        order_summary_2.sum_of_refund_amount: "#8fb1cf"
        of_total_sales: "#707070"
      show_dropoff: false
      defaults_version: 1
      hidden_fields: []
      row: 21
      col: 0
      height: 6
      width: 6



    - name: mtd_refund
#       title: MTD AVG Weekly
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.mtd_sum_of_refund_amount, order_summary_2.mtd_sum_of_total_prices,
        order_summary_2.mtd_week_count]
      filters:
        order_summary_2.current_date_range: last week
      sorts: [order_summary_2.mtd_sum_of_total_prices desc]
      limit: 500
      dynamic_fields:
      - table_calculation: mtd_avg_weekly_refund
        label: mtd_avg_weekly_refund
        expression: "${order_summary_2.mtd_sum_of_refund_amount}/${order_summary_2.mtd_week_count}"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      - table_calculation: mtd_refund_prc_total_sales
        label: mtd_refund_prc_total_sales
        expression: "${order_summary_2.mtd_sum_of_total_prices}/${order_summary_2.mtd_week_count}"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: false
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: MTD
      value_format: "$###,###"
#       comparison_label: Total Sales
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 856},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 855}, {type: less than, value: 0, background_color: '', font_color: "#C68381",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 859},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 857}]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 824}], showLabels: true, showValues: true, valueFormat: "$###,###",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
          __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 824},
        {label: '', orientation: right, series: [{axisId: of_total_sales, id: of_total_sales,
              name: "% of Total Sales", __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 828}], showLabels: true, showValues: true, unpinAxis: false,
          tickDensity: default, type: linear, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 827}]
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
      hide_legend: false
      legend_position: center
      label_value_format: ''
      series_types: {}
      point_style: none
      series_colors:
        of_total_sale: "#4E505B"
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      label: "% of Total Sales"
      expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      collection_id: ettitude
      palette_id: ettitude-categorical-0
      options:
      steps: 5
      show_hide: hide
      first_last: first
      num_rows: 0
      order_summary_2.count_of_refund_order: line
      of_total_sales: "#707070"
      order_summary_2.sum_of_refund_amount: "#8fb1cf"
      defaults_version: 1
      hidden_fields: [order_summary_2.mtd_sum_of_refund_amount, order_summary_2.mtd_sum_of_total_prices,
        order_summary_2.mtd_week_count]
      row: 21
      col: 6
      height: 3
      width: 5


    - name: last_month_refund_2
      title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.last_month_week_count, order_summary_2.last_month_sum_of_total_prices,
        order_summary_2.last_month_sum_of_refund_amount]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      dynamic_fields:
      - table_calculation: last_month_avg_weekly_refund
        label: last_month_avg_weekly_refund
        expression: "${order_summary_2.last_month_sum_of_refund_amount}/${order_summary_2.last_month_week_count}"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      - table_calculation: last_month_refund_prc_total_sales
        label: last_month_refund_prc_total_sales
        expression: "${order_summary_2.last_month_sum_of_total_prices}/${order_summary_2.last_month_week_count}"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: false
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: Last Month
      value_format: "$###,###"
#       comparison_label: Weekly Total Sales
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 856},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 855}, {type: less than, value: 0, background_color: '', font_color: "#C68381",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 859},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 857}]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 824}], showLabels: true, showValues: true, valueFormat: "$###,###",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
          __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 824},
        {label: '', orientation: right, series: [{axisId: of_total_sales, id: of_total_sales,
              name: "% of Total Sales", __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 828}], showLabels: true, showValues: true, unpinAxis: false,
          tickDensity: default, type: linear, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 827}]
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
      hide_legend: false
      legend_position: center
      label_value_format: ''
      series_types: {}
      point_style: none
      series_colors:
        of_total_sale: "#4E505B"
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      label: "% of Total Sales"
      expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      collection_id: ettitude
      palette_id: ettitude-categorical-0
      options:
      steps: 5
      show_hide: hide
      first_last: first
      num_rows: 0
      order_summary_2.count_of_refund_order: line
      of_total_sales: "#707070"
      order_summary_2.sum_of_refund_amount: "#8fb1cf"
      defaults_version: 1
      hidden_fields: [order_summary_2.last_month_week_count, order_summary_2.last_month_sum_of_total_prices,
        order_summary_2.last_month_sum_of_refund_amount]
      row: 24
      col: 6
      height: 3
      width: 5

    - name: last_quarter_refund
#       title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.last_quarter_sum_of_refund_amount, order_summary_2.last_quarter_sum_of_total_prices]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      dynamic_fields:
      - table_calculation: last_quarter_weekly_refund
        label: last_quarter_weekly_refund
        expression: "${order_summary_2.last_quarter_sum_of_refund_amount}/13"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      - table_calculation: last_quarter_weekly_total_prices
        label: last_quarter_weekly_total_prices
        expression: "${order_summary_2.last_quarter_sum_of_total_prices}/13"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: false
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: Last Quarter
      value_format: "$###,###"
      comparison_label: Weekly Total Sales
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 856},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 855}, {type: less than, value: 0, background_color: '', font_color: "#C68381",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 859},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 857}]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 824}], showLabels: true, showValues: true, valueFormat: "$###,###",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
          __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 824},
        {label: '', orientation: right, series: [{axisId: of_total_sales, id: of_total_sales,
              name: "% of Total Sales", __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 828}], showLabels: true, showValues: true, unpinAxis: false,
          tickDensity: default, type: linear, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 827}]
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
      hide_legend: false
      legend_position: center
      label_value_format: ''
      series_types: {}
      point_style: none
      series_colors:
        of_total_sale: "#4E505B"
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      label: "% of Total Sales"
      expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      collection_id: ettitude
      palette_id: ettitude-categorical-0
      options:
      steps: 5
      show_hide: hide
      first_last: first
      num_rows: 0
      order_summary_2.count_of_refund_order: line
      of_total_sales: "#707070"
      order_summary_2.sum_of_refund_amount: "#8fb1cf"
      defaults_version: 1
      hidden_fields: [order_summary_2.last_quarter_sum_of_refund_amount, order_summary_2.last_quarter_sum_of_total_prices]
      row: 21
      col: 11
      height: 3
      width: 5

    - name: same_quarter_ly_refund
#       title: Untitled Visualization
      model: ettitude_vu02_au
      explore: order_summary_2
      type: single_value
      fields: [order_summary_2.same_quarter_ly_sum_of_refund_amount, order_summary_2.same_quarter_ly_sum_of_total_prices]
      filters:
        order_summary_2.current_date_range: last week
      limit: 500
      dynamic_fields:
      - table_calculation: last_quarter_weekly_refund
        label: last_quarter_weekly_refund
        expression: "${order_summary_2.same_quarter_ly_sum_of_refund_amount}/13"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      - table_calculation: last_quarter_weekly_total_prices
        label: last_quarter_weekly_total_prices
        expression: "${order_summary_2.same_quarter_ly_sum_of_total_prices}/13"
        value_format:
        value_format_name: usd
        _kind_hint: measure
        _type_hint: number
      query_timezone: America/Los_Angeles
      custom_color_enabled: true
      show_single_value_title: true
      show_comparison: true
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: false
      enable_conditional_formatting: false
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      custom_color: "#4d578c"
      single_value_title: Same Q LY
      value_format: "$###,###"
      comparison_label: Weekly Total Sales
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 856},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 855}, {type: less than, value: 0, background_color: '', font_color: "#C68381",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 859},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 857}]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 824}], showLabels: true, showValues: true, valueFormat: "$###,###",
          unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear,
          __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 824},
        {label: '', orientation: right, series: [{axisId: of_total_sales, id: of_total_sales,
              name: "% of Total Sales", __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
              __LINE_NUM: 828}], showLabels: true, showValues: true, unpinAxis: false,
          tickDensity: default, type: linear, __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 827}]
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
      hide_legend: false
      legend_position: center
      label_value_format: ''
      series_types: {}
      point_style: none
      series_colors:
        of_total_sale: "#4E505B"
      show_value_labels: true
      label_density: 25
      x_axis_scale: auto
      y_axis_combined: true
      ordering: none
      show_null_labels: false
      show_dropoff: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      label: "% of Total Sales"
      expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      collection_id: ettitude
      palette_id: ettitude-categorical-0
      options:
      steps: 5
      show_hide: hide
      first_last: first
      num_rows: 0
      order_summary_2.count_of_refund_order: line
      of_total_sales: "#707070"
      order_summary_2.sum_of_refund_amount: "#8fb1cf"
      defaults_version: 1
      hidden_fields: [order_summary_2.same_quarter_ly_sum_of_refund_amount, order_summary_2.same_quarter_ly_sum_of_total_prices]
      row: 24
      col: 11
      height: 3
      width: 5


    - name: 8_weeks_refund
      title: Last 8 weeks
      model: ettitude_vu02_au
      explore: order_summary_2
      type: looker_column
      fields: [order_summary_2.445_week, order_summary_2.date_number_445_full, order_summary_2.sum_of_refund_amount,
        order_summary_2.sum_of_total_price]
      filters:
        order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      sorts: [order_summary_2.date_number_445_full]
      limit: 500
      dynamic_fields:
      - table_calculation: of_total_sale
        label: "% of Total Sale"
        expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
        value_format:
        value_format_name: percent_1
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
      y_axes: [{label: '', orientation: left, series: [{axisId: order_summary_2.sum_of_refund_amount,
              id: order_summary_2.sum_of_refund_amount, name: Sum of Refund Amount}],
          showLabels: true, showValues: true, valueFormat: "$###,###", unpinAxis: false,
          tickDensity: default, tickDensityCustom: 5, type: linear}, {label: '', orientation: right,
          series: [{axisId: of_total_sale, id: of_total_sale, name: "% of Total Sale"}],
          showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
          type: linear}]
      hide_legend: false
      label_value_format: ''
      series_types:
        of_total_sale: line
      series_colors:
        of_total_sale: "#4E505B"
      show_dropoff: false
      order_summary_2.date_time_to_filter_us_tz: 8 weeks ago for 8 weeks
      label: "% of Total Sales"
      expression: "${order_summary_2.sum_of_refund_amount}/${order_summary_2.sum_of_total_price}"
      value_format: "$###,###"
      value_format_name: percent_1
      _kind_hint: measure
      _type_hint: number
      collection_id: ettitude
      palette_id: ettitude-categorical-0
      options:
      steps: 5
      show_hide: hide
      first_last: first
      num_rows: 0
      order_summary_2.count_of_refund_order: line
      of_total_sales: "#707070"
      order_summary_2.sum_of_refund_amount: "#8fb1cf"
      custom_color_enabled: true
      custom_color: "#4d578c"
      show_single_value_title: true
      single_value_title: Previous Net Sales
      show_comparison: false
      comparison_type: progress_percentage
      comparison_reverse_colors: false
      show_comparison_label: true
      comparison_label: Previous week
      enable_conditional_formatting: false
      conditional_formatting: [{type: greater than, value: 0, background_color: '', font_color: "#657863",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 998},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 997}, {type: less than, value: 0, background_color: '', font_color: "#C68381",
          color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml, __LINE_NUM: 1002},
          bold: false, italic: false, strikethrough: false, fields: !!null '', __FILE: ettitude_vu02_au/dashboards/last_week_sales.dashboard.lookml,
          __LINE_NUM: 1001}]
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      defaults_version: 1
      hidden_fields: [order_summary_2.date_number_445_full, order_summary_2.sum_of_total_price]
      row: 21
      col: 16
      height: 6
      width: 8



                        #  Product Section
    - name: text_05
      type: text
      title_text: Product Category Contribution
      row: 27
      col: 0
      width: 24
      height: 2
    - name: category_contribution_01
      title: Last Complete Week
      model: ettitude_vu02_au
      explore: variant_daily_sales_2
      type: looker_bar
      fields: [variant_daily_sales_2.current_period_net_sales, variant_daily_sales_2.category_custom_sort]
      pivots: [variant_daily_sales_2.category_custom_sort]
      filters:
        variant_daily_sales_2.current_date_range: last week
        variant_daily_sales_2.category_custom_sort: "-not_considered"
      sorts: [variant_daily_sales_2.current_period_net_sales desc 0, variant_daily_sales_2.category_custom_sort]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      row: 29
      col: 0
      height: 3
      width: 8

    - name: category_contribution_05
      title: Same Week LY
      model: ettitude_vu02_au
      explore: variant_daily_sales_2
      type: looker_bar
      fields: [variant_daily_sales_2.category_custom_sort, variant_daily_sales_2.same_period_last_year_net_sales]
      pivots: [variant_daily_sales_2.category_custom_sort]
      filters:
        variant_daily_sales_2.current_date_range: last week
        variant_daily_sales_2.category_custom_sort: "-not_considered"
      sorts: [variant_daily_sales_2.category_custom_sort]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      row: 32
      col: 0
      height: 3
      width: 8

    - name: category_contribution_02
      title: Last 8 Weeks
      model: ettitude_vu02_au
      explore: variant_daily_sales_2
      type: looker_bar
      fields: [variant_daily_sales_2.category_custom_sort, variant_daily_sales_2._445_week,
        variant_daily_sales_2.total_pre_tax_price, variant_daily_sales_2.date_number_445_full]
      pivots: [variant_daily_sales_2.category_custom_sort]
      filters:
        variant_daily_sales_2.category_custom_sort: "-not_considered"
        variant_daily_sales_2.created_autz_date: 8 weeks ago for 8 weeks
      sorts: [variant_daily_sales_2.category_custom_sort 0, variant_daily_sales_2.date_number_445_full]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      hidden_fields: [variant_daily_sales_2.date_number_445_full]
      row: 29
      col: 8
      height: 6
      width: 8

    - name: category_contribution_03
      title: Last 8 Quarters
      model: ettitude_vu02_au
      explore: variant_daily_sales_2
      type: looker_bar
      fields: [variant_daily_sales_2.category_custom_sort, variant_daily_sales_2.total_pre_tax_price,
        variant_daily_sales_2._445_quarter_text]
      pivots: [variant_daily_sales_2.category_custom_sort]
      filters:
        variant_daily_sales_2.category_custom_sort: "-not_considered"
        variant_daily_sales_2.created_autz_date: 8 quarters ago for 8 quarters
        variant_daily_sales_2._445_quarter_text: "-NULL"
      sorts: [variant_daily_sales_2.category_custom_sort 0, variant_daily_sales_2._445_quarter_text]
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
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      series_types: {}
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      hidden_fields: []
      row: 29
      col: 16
      height: 6
      width: 8



                        #  Product Section
    - name: text_06
      type: text
      title_text: Product Growth
      row: 35
      col: 0
      width: 24
      height: 2


    - name: product Growth
      title: Growth - Top 30 Product by Sales Quantity
      model: ettitude_vu02_au
      explore: variant_daily_sales_2
      type: looker_grid
      fields: [variant_daily_sales_2.product, variant_daily_sales_2.current_period_units_sold,
        variant_daily_sales_2.same_period_last_year_units_sold, variant_daily_sales_2.previous_period_units_sold]
      filters:
        variant_daily_sales_2.current_date_range: last week
        variant_daily_sales_2.product: "-NULL"
      sorts: [variant_daily_sales_2.current_period_units_sold desc]
      limit: 500
      dynamic_fields:
      - table_calculation: previous_week_rank
        label: Previous Week Rank
        expression: rank(${variant_daily_sales_2.previous_period_units_sold},${variant_daily_sales_2.previous_period_units_sold})
        value_format:
        value_format_name: decimal_0
        _kind_hint: measure
        _type_hint: number
      - table_calculation: pop_change
        label: POP % Change
        expression: "(${variant_daily_sales_2.current_period_units_sold}-${variant_daily_sales_2.previous_period_units_sold})/${variant_daily_sales_2.previous_period_units_sold}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: yoy_change
        label: YOY % Change
        expression: "(${variant_daily_sales_2.current_period_units_sold}- ${variant_daily_sales_2.same_period_last_year_units_sold})/${variant_daily_sales_2.same_period_last_year_units_sold}"
        value_format:
        value_format_name: percent_1
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
      limit_displayed_rows: true
      enable_conditional_formatting: true
      header_text_alignment: left
      header_font_size: '12'
      rows_font_size: '12'
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      show_sql_query_menu_options: false
      show_totals: true
      show_row_totals: true
      series_labels:
        variant_daily_sales_2.current_period_units_sold: Last Week Units Sold
        variant_daily_sales_2.previous_period_units_sold: Previous Week Unit Sold
        previous_week_rank: Pre W Rank
      series_column_widths:
        variant_daily_sales_2.current_period_units_sold: 250
        variant_daily_sales_2.previous_period_units_sold: 250
        pop_change: 150
        yoy_change: 150
        last_week_rank: 150
        previous_week_rank: 100
      series_cell_visualizations:
        variant_daily_sales_2.current_period_units_sold:
          is_active: true
          palette:
            palette_id: ettitude-diverging-0
            collection_id: ettitude
        variant_daily_sales_2.previous_period_units_sold:
          is_active: true
          palette:
            palette_id: ettitude-diverging-0
            collection_id: ettitude
        last_week_rank:
          is_active: false
          palette:
            palette_id: ettitude-sequential-0
            collection_id: ettitude
          value_display: true
      series_text_format:
        pop_change:
          align: right
        yoy_change:
          align: right
        previous_week_rank:
          align: center
      limit_displayed_rows_values:
        show_hide: show
        first_last: first
        num_rows: '30'
      conditional_formatting: [{type: along a scale..., value: !!null '', background_color: "#C68381",
          font_color: !!null '', color_application: {collection_id: ettitude, palette_id: ettitude-diverging-0,
            options: {steps: 5, constraints: {min: {type: number, value: -2}, mid: {type: number,
                  value: 0}, max: {type: number, value: 2}}, mirror: false, reverse: false,
              stepped: false}}, bold: false, italic: false, strikethrough: false, fields: [
            pop_change]}, {type: along a scale..., value: !!null '', background_color: "#C68381",
          font_color: !!null '', color_application: {collection_id: ettitude, palette_id: ettitude-diverging-0,
            options: {steps: 5, constraints: {min: {type: number, value: 0}, mid: {type: number,
                  value: 4}, max: {type: number, value: 30}}, mirror: false, reverse: false,
              stepped: false}}, bold: false, italic: false, strikethrough: false, fields: [
            yoy_change]}, {type: along a scale..., value: !!null '', background_color: "#C68381",
          font_color: !!null '', color_application: {collection_id: ettitude, palette_id: ettitude-sequential-0,
            options: {steps: 5, constraints: {min: {type: minimum}, mid: {type: middle},
                max: {type: maximum}}, mirror: true, reverse: true, stepped: false}},
          bold: false, italic: false, strikethrough: false, fields: [previous_week_rank]}]
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
      stacking: percent
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
      series_types: {}
      defaults_version: 1
      value_labels: legend
      label_type: labPer
      hidden_fields: [variant_daily_sales_2.same_period_last_year_units_sold]
      row: 37
      col: 4
      height: 12
      width: 16
