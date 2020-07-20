package com.casadogg.skoreiotest.classroom.model

import com.fasterxml.jackson.databind.PropertyNamingStrategy
import com.fasterxml.jackson.databind.annotation.JsonNaming

/**
 * @param createdAt Creation date in milliseconds
 * */
@JsonNaming(PropertyNamingStrategy.SnakeCaseStrategy::class)
data class Classroom(
    val companyId: String,
    val createdAt: Long,
    val name: String,
    val id: String,
    val status: ClassroomStatus,
    val summary: ClassroomSummary
)
