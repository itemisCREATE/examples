#include <stdio.h>

#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"


static void eventDelegater(void *parameters);
static void timerCallback(TimerHandle_t timerHandle);

static QueueHandle_t eventQueue = NULL;

int main(void)
{
    eventQueue = xQueueCreate(2, sizeof(uint32_t));
    if (eventQueue == NULL)
    {
        printf("Failed to initialize queue.\n");
        return 1;
    }

    xTaskCreate(eventDelegater,
                "TaskReceiver",
                configMINIMAL_STACK_SIZE,
                NULL,
                1,
                NULL);

    TimerHandle_t xTimer = xTimerCreate("Timer",
                                        1000,
                                        pdTRUE,
                                        NULL,
                                        timerCallback);
    if (xTimer == NULL)
    {
        printf("Failed to initialize timer.\n");
        return 1;
    }
    xTimerStart(xTimer, 0);
    vTaskStartScheduler();
    return 0;
}

static void timerCallback(TimerHandle_t timerHandle)
{
    (void)timerHandle;
    const uint32_t updateTimerServiceID = 1;
    xQueueSend(eventQueue, &updateTimerServiceID, 0U);
}

static void eventDelegater(void *parameters)
{
    (void)parameters;
    uint32_t receivedID;
    for (;;)
    {
        xQueueReceive(eventQueue, &receivedID, portMAX_DELAY);
        if (receivedID == 1)
        {
            printf("Message received from software timer\n");
        }
    }
}
