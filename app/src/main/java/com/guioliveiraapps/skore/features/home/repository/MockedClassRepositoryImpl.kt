package com.guioliveiraapps.skore.features.home.repository

import com.google.gson.Gson
import com.guioliveiraapps.skore.api.ApiResult
import com.guioliveiraapps.skore.model.Class
import kotlinx.coroutines.delay

class MockedClassRepositoryImpl : ClassRepository {
    private val apiDelaySimulationTime = 2000L

    override suspend fun getClasses(): ApiResult<ArrayList<Class>> {
        delay(apiDelaySimulationTime)
        val json = "[\n" +
                "    {\n" +
                "        \"company_id\": \"114\",\n" +
                "        \"created_at\": 1571323199864,\n" +
                "        \"name\": \"Aula Álgebra\",\n" +
                "        \"id\": \"114_0v62DokeArxPA9oDSBst_349785\",\n" +
                "        \"status\": \"IN_PROGRESS\",\n" +
                "        \"summary\": {\n" +
                "            \"percentage\": 20\n" +
                "        }\n" +
                "    },\n" +
                "    {\n" +
                "        \"company_id\": \"114\",\n" +
                "        \"created_at\": 1578343188529,\n" +
                "        \"name\": \"Aula Trigonometria\",\n" +
                "        \"id\": \"114_3Lj7okST2yBSYXUUByg2_349798\",\n" +
                "        \"status\": \"NOT_STARTED\",\n" +
                "        \"summary\": {\n" +
                "            \"percentage\": null\n" +
                "        }\n" +
                "    },\n" +
                "    {\n" +
                "        \"company_id\": \"114\",\n" +
                "        \"created_at\": 1568918240759,\n" +
                "        \"name\": \"Aula Filosofia\",\n" +
                "        \"id\": \"114_3O81FOuWLZIlSDnRJHm1_349798\",\n" +
                "        \"status\": \"COMPLETED\",\n" +
                "        \"summary\": {\n" +
                "            \"percentage\": 100\n" +
                "        }\n" +
                "    },\n" +
                "    {\n" +
                "        \"company_id\": \"114\",\n" +
                "        \"created_at\": 1574361972593,\n" +
                "        \"name\": \"Aula Geografia\",\n" +
                "        \"id\": \"114_46keopvfEUvlNP7bd049_349798\",\n" +
                "        \"status\": \"IN_PROGRESS\",\n" +
                "        \"summary\": {\n" +
                "            \"percentage\": 75\n" +
                "        }\n" +
                "    },\n" +
                "    {\n" +
                "        \"company_id\": \"114\",\n" +
                "        \"created_at\": 1571946887159,\n" +
                "        \"name\": \"Aula História\",\n" +
                "        \"id\": \"114_5FK4ExJCz3vW4XmS0KVr_349798\",\n" +
                "        \"status\": \"NOT_STARTED\",\n" +
                "        \"summary\": {\n" +
                "            \"percentage\": null\n" +
                "        }\n" +
                "    }\n" +
                "]"

        val classList = Gson().fromJson(json, Array<Class>::class.java).asList()
        return ApiResult.Success(ArrayList(classList))
    }

}