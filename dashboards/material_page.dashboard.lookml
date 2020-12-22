- dashboard: material_page
  title: Material Page
  layout: newspaper
  preferred_viewer: dashboards-next

  filters:

  elements:
    - name: add_a_unique_name_1608327540
      title: Entrances
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, exit_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_pageviews, unique_pageview_per_session]
      row: 0
      col: 0
      height: 6
      width: 8


    - name: add_a_unique_name_1608320474
      title: Entrances by Device
      model: ettitude_vu02_au
      explore: material_page
      type: looker_column
      fields: [material_page.date_pk, material_page.total_entrances, material_page.total_exit,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_types: {}
      series_colors: {}
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, exit_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_pageviews, unique_pageview_per_session]
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      row: 0
      col: 8
      height: 6
      width: 8



    - name: add_a_unique_name_1608320539
      title: Page views
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, exit_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_entrances, unique_pageview_per_session]
      row: 6
      col: 0
      height: 6
      width: 8

    - name: add_a_unique_name_1608320616
      title: Pageviews by Devices
      model: ettitude_vu02_au
      explore: material_page
      type: looker_column
      fields: [material_page.date_pk, material_page.total_entrances, material_page.total_exit,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_types: {}
      series_colors: {}
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, exit_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_entrances, unique_pageview_per_session]
      show_row_numbers: true
      transpose: false
      truncate_text: true
      hide_totals: false
      hide_row_totals: false
      size_to_fit: true
      table_theme: white
      enable_conditional_formatting: false
      header_text_alignment: left
      header_font_size: 12
      rows_font_size: 12
      conditional_formatting_include_totals: false
      conditional_formatting_include_nulls: false
      row: 6
      col: 8
      height: 6
      width: 8

    - name: placeholder_1
      type: text
      height: 6
      width: 8
      row: 0
      col: 16

    - name: placeholder_22
      type: text
      height: 6
      width: 8
      row: 12
      col: 16

    - name: placeholder_2
      type: text
      height: 6
      width: 8
      row: 18
      col: 16

    - name: placeholder_3
      type: text
      height: 6
      width: 8
      row: 24
      col: 16
    - name: all_page_pageviews
      title: All Site - Pageview by Devices
      model: ettitude_vu02_au
      explore: all_page
      type: looker_column
      fields: [all_page.total_pageviews, all_page.date_pk, all_page.device_category]
      pivots: [all_page.device_category]
      fill_fields: [all_page.date_pk]
      filters:
        all_page.date_pk: 2020/12/13 to 2020/12/18
        all_page.device_category: "-tablet"
      sorts: [all_page.date_pk desc, all_page.device_category]
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
      show_null_points: true
      interpolation: linear
      defaults_version: 1
      row: 6
      col: 16
      height: 6
      width: 8


    - name: add_a_unique_name_1608320539sa
      title: Exit Rate
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_entrances, unique_pageview_per_session, material_page.total_pageviews]
      row: 12
      col: 0
      height: 6
      width: 8

    - name: add_a_unique_name_1608320s616as
      title: Exit Rate by Devices
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
          __FILE: ettitude_vu02_au/dashboards/material_page.dashboard.lookml
          __LINE_NUM: 454
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, bounce_rate, avg_time_on_page_second,
        material_page.total_time_on_page, material_page.total_entrances, unique_pageview_per_session,
        material_page.total_pageviews]
      row: 12
      col: 8
      height: 6
      width: 8

    - name: unique_pageview_per_session
      title: Unique Pageview per Session (UPS)
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, avg_time_on_page_second, material_page.total_time_on_page,
        material_page.total_entrances, exit_rate, material_page.total_pageviews]
      row: 18
      col: 0
      height: 6
      width: 8

    - name: unique_pageview_per_session2
      title: UPS by Devices
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
          __FILE: ettitude_vu02_au/dashboards/material_page.dashboard.lookml
          __LINE_NUM: 454
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, bounce_rate, avg_time_on_page_second,
        material_page.total_time_on_page, material_page.total_entrances, exit_rate,
        material_page.total_pageviews]
      row: 18
      col: 8
      height: 6
      width: 8


    - name: time_spent_on_page
      title: Avg Time Spent on Page (secs)
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, bounce_rate, unique_pageview_per_session, material_page.total_time_on_page,
        material_page.total_entrances, exit_rate, material_page.total_pageviews]
      row: 24
      col: 0
      height: 6
      width: 8

    - name: time_spent_on_page2
      title: Avg Time Spent on Page by Devices (secs)
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
          __FILE: ettitude_vu02_au/dashboards/material_page.dashboard.lookml
          __LINE_NUM: 454
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, bounce_rate, unique_pageview_per_session,
        material_page.total_time_on_page, material_page.total_entrances, exit_rate,
        material_page.total_pageviews]
      row: 24
      col: 8
      height: 6
      width: 8



    - name: bounce_rate1
      title: Bounce Rate
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews, material_page.total_bounces,
        all_page.total_sessions, avg_time_on_page_second, unique_pageview_per_session, material_page.total_time_on_page,
        material_page.total_entrances, exit_rate, material_page.total_pageviews]
      row: 30
      col: 0
      height: 6
      width: 8

    - name: bounce_rate2
      title: Bounce Rate by Devices
      model: ettitude_vu02_au
      explore: material_page
      type: looker_line
      fields: [material_page.date_pk, material_page.total_exit, material_page.total_entrances,
        material_page.total_pageviews, material_page.total_time_on_page, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, material_page.device_category]
      pivots: [material_page.device_category]
      fill_fields: [material_page.date_pk]
      filters:
        material_page.date_pk: 2020/12/13 to 2020/12/18
        material_page.device_category: "-tablet"
      sorts: [material_page.date_pk desc, material_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${material_page.total_bounces}/${material_page.total_entrances}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: exit_rate
        label: exit_rate
        expression: "${material_page.total_exit}/${material_page.total_pageviews}"
        value_format:
        value_format_name: percent_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: avg_time_on_page_second
        label: avg_time_on_page_second
        expression: "${material_page.total_time_on_page}/${material_page.total_pageviews}"
        value_format:
        value_format_name: decimal_1
        _kind_hint: measure
        _type_hint: number
      - table_calculation: unique_pageview_per_session
        label: unique_pageview_per_session
        expression: "${material_page.total_unique_pageviews}/${all_page.total_sessions}"
        value_format:
        value_format_name: percent_2
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
      show_null_points: true
      interpolation: linear
      color_application:
        collection_id: ettitude
        palette_id: ettitude-categorical-0
        options:
          steps: 5
          __FILE: ettitude_vu02_au/dashboards/material_page.dashboard.lookml
          __LINE_NUM: 454
      series_colors: {}
      defaults_version: 1
      hidden_fields: [material_page.total_exit, material_page.total_entrances, material_page.total_unique_pageviews,
        material_page.total_bounces, all_page.total_sessions, avg_time_on_page_second, unique_pageview_per_session,
        material_page.total_time_on_page, material_page.total_entrances, exit_rate,
        material_page.total_pageviews]
      row: 30
      col: 8
      height: 6
      width: 8


    - name: all_site_bouncerate
      title: All Site - Bounce Rate by Devices
      model: ettitude_vu02_au
      explore: all_page
      type: looker_line
      fields: [all_page.date_pk, all_page.total_pageviews, all_page.total_bounces, all_page.total_sessions,
        all_page.device_category]
      pivots: [all_page.device_category]
      fill_fields: [all_page.date_pk]
      filters:
        all_page.date_pk: 7 days
        all_page.device_category: "-tablet"
      sorts: [all_page.date_pk desc, all_page.device_category]
      limit: 500
      dynamic_fields:
      - table_calculation: bounce_rate
        label: bounce_rate
        expression: "${all_page.total_bounces}/${all_page.total_sessions}"
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
      show_null_points: true
      interpolation: linear
      series_types: {}
      ordering: none
      show_null_labels: false
      show_totals_labels: false
      show_silhouette: false
      totals_color: "#808080"
      defaults_version: 1
      hidden_fields: [all_page.total_sessions, all_page.total_bounces, all_page.total_pageviews]
      row: 30
      col: 16
      height: 6
      width: 8
