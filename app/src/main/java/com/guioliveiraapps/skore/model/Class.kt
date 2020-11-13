package com.guioliveiraapps.skore.model

import com.squareup.moshi.Json

data class Class(
    @Json(name = "company_id") val companyId: String,
    @Json(name = "created_at") val createdAt: Long,
    val name: String,
    val id: String,
    val status: StatusEnum,
    val summary: Summary
)