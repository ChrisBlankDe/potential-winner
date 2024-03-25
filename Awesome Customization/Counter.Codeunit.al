codeunit 50100 Counter
{
    trigger OnRun()
    var
        TheCounterIsMsg: Label 'The counter is %1.';
    begin
        Message(TheCounterIsMsg, Get())
    end;

    /// <summary>
    /// Increments the Counter by one.
    /// </summary>
    /// <example>
    /// <code>
    /// Counter.Increment();
    /// </code>
    /// </example>
    procedure Increment()
    begin
        Counter += 1
    end;

    /// <summary>
    /// Increments the Counter by a given Number.
    /// </summary>
    /// <example>
    /// <code>
    /// Counter.Increment(5);
    /// </code>
    /// </example>
    /// <param name="Steps"></param>
    procedure Increment(Steps: Integer)
    begin
        Counter += Steps;
    end;

    /// <summary>
    /// Returns the current Counter value.
    /// </summary>
    /// <example>
    /// <code>
    /// AnyInt := Counter.Get();
    /// </code>
    /// </example>
    /// <remarks>There is no overflow control.</remarks>
    /// <returns>The current Counter value</returns>
    procedure Get(): Integer
    begin
        exit(Counter);
    end;

    /// <summary>
    /// Set the coutner to a given value.
    /// </summary>
    /// <example>
    /// <code>
    /// Counter.Set(5);
    /// </code>
    /// </example>
    /// <param name="Value">The new Counter value</param>
    procedure Set(Value: Integer)
    var
        Handled: Boolean;
    begin
        OnBeforeSetCounter(Value, Handled);
        if not Handled then
            Counter := Value;
    end;

    /// <summary>
    /// Event triggered before the Counter is set.
    /// </summary>
    /// <param name="Value">The value going to be set</param>
    /// <param name="Handled"></param>
    [IntegrationEvent(true, false)]
    local procedure OnBeforeSetCounter(var Value: Integer; var Handled: Boolean)
    begin
    end;

    var
        Counter: Integer;
}