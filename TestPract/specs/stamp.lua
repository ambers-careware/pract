--!strict

local Types = require(script.Parent.Parent.Types)

local spec: Types.Spec = function(practModule, describe)
    local stamp: any = require(practModule.stamp)
    local Symbols: any = require(practModule.Symbols)

    describe('stamp', function(it)
        local TEMPLATE = Instance.new('Folder')
        it('Should create an element with empty props', function(expect)
            local element = stamp(TEMPLATE)
            expect.equal(Symbols.ElementKinds.Stamp, element[Symbols.ElementKind])
            expect.equal(TEMPLATE, element.template)
            expect.deep_equal({}, element.props)
        end)
        it('Should accept props', function(expect)
            local element = stamp(TEMPLATE, {foo = 'Fighters'})
            expect.equal(Symbols.ElementKinds.Stamp, element[Symbols.ElementKind])
            expect.equal(TEMPLATE, element.template)
            expect.deep_equal({foo='Fighters'}, element.props)
        end)
        it('Should accept props and children', function(expect)
            local element = stamp(TEMPLATE, {foo = 'Fighters'}, {})
            expect.equal(Symbols.ElementKinds.Stamp, element[Symbols.ElementKind])
            expect.equal(TEMPLATE, element.template)
            expect.deep_equal({foo='Fighters', [Symbols.Children] = {}}, element.props)
        end)
        it('Should accept children without props', function(expect)
            local element = stamp(TEMPLATE, nil, {})
            expect.equal(Symbols.ElementKinds.Stamp, element[Symbols.ElementKind])
            expect.equal(TEMPLATE, element.template)
            expect.deep_equal({[Symbols.Children] = {}}, element.props)
        end)
    end)
end

return spec