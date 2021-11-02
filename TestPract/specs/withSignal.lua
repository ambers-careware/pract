--!strict

local Types = require(script.Parent.Parent.Types)

local spec: Types.Spec = function(practModule, describe)
    local withSignal: any = require(practModule.withSignal)
    local Symbols: any = require(practModule.Symbols)

    describe('withSignal', function(it)
        local signal = Instance.new('BindableEvent').Event
        it('should wrap a component', function(expect)
            local wrappedClosureCreator = function() end
            local finalComponent = withSignal(signal, wrappedClosureCreator)
            
            expect.truthy(finalComponent)
        end)
        it('should return a component that returns a unique element', function(expect)
            local wrappedClosureCreator = function() end
            local finalComponent = withSignal(signal, wrappedClosureCreator)
            local props = {}
            local element = finalComponent(props)
            
            expect.equal(Symbols.ElementKinds.SignalComponent, element[Symbols.ElementKind])
            expect.equal(props, element.props)
            expect.equal(wrappedClosureCreator, element.makeClosure)
            expect.equal(signal, element.signal)
        end)
    end)
end

return spec