{
  /**
   * Creates an [Elasticsearch target](https://grafana.com/docs/grafana/latest/datasources/elasticsearch/)
   *
   * @name elasticsearch.target
   *
   * @param query
   * @param timeField
   * @param id (optional)
   * @param datasource (optional)
   * @param metrics (optional)
   * @param bucketAggs (optional)
   * @param alias (optional)
   */
  target(
    query,
    timeField,
    id=null,
    queryType=null,
    datasource=null,
    metrics=[{
      field: 'value',
      id: null,
      type: 'percentiles',
      settings: {
        percents: [
          '90',
        ],
      },
    }],
    bucketAggs=[{
      field: 'timestamp',
      id: null,
      type: 'date_histogram',
      settings: {
        interval: '1s',
        min_doc_count: 0,
        trimEdges: 0,
      },
    }],
    alias=null,
  ):: {
    [if datasource != null then 'datasource']: datasource,
    query: query,
    [if queryType != null then 'queryType']: queryType,
    [if id != null then 'id']: id,
    timeField: timeField,
    bucketAggs: bucketAggs,
    metrics: metrics,
    [if alias != null then 'alias']: alias,
    // TODO: generate bucket ids
  },
}
