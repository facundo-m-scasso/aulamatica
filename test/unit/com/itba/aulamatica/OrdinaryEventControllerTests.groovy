package com.itba.aulamatica



import org.junit.*
import grails.test.mixin.*

@TestFor(OrdinaryEventController)
@Mock(OrdinaryEvent)
class OrdinaryEventControllerTests {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void testIndex() {
        controller.index()
        assert "/ordinaryEvent/list" == response.redirectedUrl
    }

    void testList() {

        def model = controller.list()

        assert model.ordinaryEventInstanceList.size() == 0
        assert model.ordinaryEventInstanceTotal == 0
    }

    void testCreate() {
        def model = controller.create()

        assert model.ordinaryEventInstance != null
    }

    void testSave() {
        controller.save()

        assert model.ordinaryEventInstance != null
        assert view == '/ordinaryEvent/create'

        response.reset()

        populateValidParams(params)
        controller.save()

        assert response.redirectedUrl == '/ordinaryEvent/show/1'
        assert controller.flash.message != null
        assert OrdinaryEvent.count() == 1
    }

    void testShow() {
        controller.show()

        assert flash.message != null
        assert response.redirectedUrl == '/ordinaryEvent/list'

        populateValidParams(params)
        def ordinaryEvent = new OrdinaryEvent(params)

        assert ordinaryEvent.save() != null

        params.id = ordinaryEvent.id

        def model = controller.show()

        assert model.ordinaryEventInstance == ordinaryEvent
    }

    void testEdit() {
        controller.edit()

        assert flash.message != null
        assert response.redirectedUrl == '/ordinaryEvent/list'

        populateValidParams(params)
        def ordinaryEvent = new OrdinaryEvent(params)

        assert ordinaryEvent.save() != null

        params.id = ordinaryEvent.id

        def model = controller.edit()

        assert model.ordinaryEventInstance == ordinaryEvent
    }

    void testUpdate() {
        controller.update()

        assert flash.message != null
        assert response.redirectedUrl == '/ordinaryEvent/list'

        response.reset()

        populateValidParams(params)
        def ordinaryEvent = new OrdinaryEvent(params)

        assert ordinaryEvent.save() != null

        // test invalid parameters in update
        params.id = ordinaryEvent.id
        //TODO: add invalid values to params object

        controller.update()

        assert view == "/ordinaryEvent/edit"
        assert model.ordinaryEventInstance != null

        ordinaryEvent.clearErrors()

        populateValidParams(params)
        controller.update()

        assert response.redirectedUrl == "/ordinaryEvent/show/$ordinaryEvent.id"
        assert flash.message != null

        //test outdated version number
        response.reset()
        ordinaryEvent.clearErrors()

        populateValidParams(params)
        params.id = ordinaryEvent.id
        params.version = -1
        controller.update()

        assert view == "/ordinaryEvent/edit"
        assert model.ordinaryEventInstance != null
        assert model.ordinaryEventInstance.errors.getFieldError('version')
        assert flash.message != null
    }

    void testDelete() {
        controller.delete()
        assert flash.message != null
        assert response.redirectedUrl == '/ordinaryEvent/list'

        response.reset()

        populateValidParams(params)
        def ordinaryEvent = new OrdinaryEvent(params)

        assert ordinaryEvent.save() != null
        assert OrdinaryEvent.count() == 1

        params.id = ordinaryEvent.id

        controller.delete()

        assert OrdinaryEvent.count() == 0
        assert OrdinaryEvent.get(ordinaryEvent.id) == null
        assert response.redirectedUrl == '/ordinaryEvent/list'
    }
}
