RuleSet: read-validate-test(resource, instance_name, return_type, profile_name)
* insert TSMetadata({instance_name}, 2022-06-08, "HL7 FHIR R4 TestScript Read Validate", "Example TestScript to test resource read and profile validation")
* insert TSOrigin(1)
* insert TSDestination(1)
* insert TSBaseProfile({resource})
* insert TSVariableDynamic("patientResourceId", "example", "[resource.id]", "Enter a known resource id on the destination system.")
* insert TSTest(PatientReadValidate, "Test resource read on destination server and assert returned resource passes validation")
* insert TSTestOperationResource(#read, #{resource}, {return_type}, 1, 1, "ResourceRead", "/${patientResourceId}")
* insert TSTestAssert("Confirm that the returned response code is 200 OK.", false, #response, responseCode, "200")
* insert TSTestAssert("Confirm that the returned response payload is the specified resource.", false, #response, resource, #{resource})
* insert TSTestAssert("Confirm that the returned resource conforms to the specified profile.", false, #response, validateProfileId, {profile_name})