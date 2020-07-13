package com.casadogg.skoreiotest.classroom.model

data class Classroom(
    val companyId: String,
    val createdAtMillis: Long,
    val name: String,
    val id: String,
    val status: ClassroomStatus,
    val summary: ClassroomSummary
)
