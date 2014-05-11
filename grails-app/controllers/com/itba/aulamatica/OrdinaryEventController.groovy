package com.itba.aulamatica

import org.springframework.dao.DataIntegrityViolationException

class OrdinaryEventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [ordinaryEventInstanceList: OrdinaryEvent.list(params), ordinaryEventInstanceTotal: OrdinaryEvent.count()]
    }

    def create() {
        [ordinaryEventInstance: new OrdinaryEvent(params)]
    }

    def save() {
        def ordinaryEventInstance = new OrdinaryEvent(params)
        if (!ordinaryEventInstance.save(flush: true)) {
            render(view: "create", model: [ordinaryEventInstance: ordinaryEventInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), ordinaryEventInstance.id])
        redirect(action: "show", id: ordinaryEventInstance.id)
    }

    def show(Long id) {
        def ordinaryEventInstance = OrdinaryEvent.get(id)
        if (!ordinaryEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "list")
            return
        }

        [ordinaryEventInstance: ordinaryEventInstance]
    }

    def edit(Long id) {
        def ordinaryEventInstance = OrdinaryEvent.get(id)
        if (!ordinaryEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "list")
            return
        }

        [ordinaryEventInstance: ordinaryEventInstance]
    }

    def update(Long id, Long version) {
        def ordinaryEventInstance = OrdinaryEvent.get(id)
        if (!ordinaryEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (ordinaryEventInstance.version > version) {
                ordinaryEventInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent')] as Object[],
                          "Another user has updated this OrdinaryEvent while you were editing")
                render(view: "edit", model: [ordinaryEventInstance: ordinaryEventInstance])
                return
            }
        }

        ordinaryEventInstance.properties = params

        if (!ordinaryEventInstance.save(flush: true)) {
            render(view: "edit", model: [ordinaryEventInstance: ordinaryEventInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), ordinaryEventInstance.id])
        redirect(action: "show", id: ordinaryEventInstance.id)
    }

    def delete(Long id) {
        def ordinaryEventInstance = OrdinaryEvent.get(id)
        if (!ordinaryEventInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "list")
            return
        }

        try {
            ordinaryEventInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ordinaryEvent.label', default: 'OrdinaryEvent'), id])
            redirect(action: "show", id: id)
        }
    }
}
