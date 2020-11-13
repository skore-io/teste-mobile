package com.guioliveiraapps.skore.model

import com.google.gson.annotations.SerializedName

data class Class(
    @SerializedName("company_id") val companyId: String,
    @SerializedName("created_at") val createdAt: Long,
    val name: String,
    val id: String,
    val status: StatusEnum,
    val summary: Summary
)